import 'dart:convert';

import 'package:ai_personal_trainer/domain/model/diet_status.dart';
import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/domain/usecase/plan_generation_usecase.dart';
import 'package:ai_personal_trainer/domain/usecase/plan_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------------------------------------------------
// UIの状態

class PlanState {
  PlanState({
    this.isLoading = false,
    this.currentResult,
    this.history = const [],
    this.errorMessage,
    this.lastInput,
  });
  final bool isLoading;
  final PlanResult? currentResult;
  final List<PlanResult> history;
  final String? errorMessage;
  final UserInput? lastInput;

  PlanState copyWith({
    bool? isLoading,
    PlanResult? currentResult,
    List<PlanResult>? history,
    String? errorMessage,
    UserInput? lastInput,
  }) {
    return PlanState(
      isLoading: isLoading ?? this.isLoading,
      currentResult: currentResult ?? this.currentResult,
      history: history ?? this.history,
      errorMessage: errorMessage,
      lastInput: lastInput ?? this.lastInput,
    );
  }
}

// --------------------------------------------------
// Notifier

class PlanNotifier extends StateNotifier<PlanState> {
  PlanNotifier({required PlanGenerationUseCase useCase})
    : _useCase = useCase,
      super(PlanState()) {
    _loadData();
  }
  final PlanGenerationUseCase _useCase;
  static const _historyKey = 'saved_plan_history_v1';
  static const _inputKey = 'saved_user_input';

  /// 💾 データ読み込み
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // 履歴
    List<PlanResult> loadedHistory = [];
    final historyJsonList = prefs.getStringList(_historyKey);
    if (historyJsonList != null) {
      try {
        loadedHistory =
            historyJsonList
                .map(
                  (jsonStr) => PlanResult.fromJson(
                    jsonDecode(jsonStr) as Map<String, dynamic>,
                  ),
                )
                .toList();
      } catch (_) {}
    }

    // 入力
    UserInput? loadedInput;
    final inputJson = prefs.getString(_inputKey);
    if (inputJson != null) {
      try {
        loadedInput = UserInput.fromJson(
          jsonDecode(inputJson) as Map<String, dynamic>,
        );
      } catch (_) {}
    }

    state = state.copyWith(history: loadedHistory, lastInput: loadedInput);
  }

  /// 🚀 プラン生成
  Future<void> generatePlan({required UserInput input}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final result = await _useCase.execute(input);

      // 履歴の先頭に追加
      final newHistory = [result, ...state.history];
      await _saveAll(newHistory, input);

      state = state.copyWith(
        isLoading: false,
        currentResult: result,
        history: newHistory,
        lastInput: input,
      );
    } catch (e, stackTrace) {
      print('💥 UI ERROR: $e');
      print('Stack: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'プラン生成に失敗しました: $e',
      );
    }
  }

  /// ✅ トレーニングの完了切り替え
  void toggleExerciseCompletion(int workoutIndex, int exerciseIndex) {
    final currentResult = state.currentResult;
    if (currentResult == null) return;

    final workouts = List<DailyWorkout>.from(
      currentResult.trainingMenu.workouts,
    );
    final targetWorkout = workouts[workoutIndex];

    final exercises = List<Exercise>.from(targetWorkout.exercises);
    final targetEx = exercises[exerciseIndex];

    // フラグ反転
    exercises[exerciseIndex] = targetEx.copyWith(
      isCompleted: !targetEx.isCompleted,
    );
    workouts[workoutIndex] = targetWorkout.copyWith(exercises: exercises);

    final updatedMenu = currentResult.trainingMenu.copyWith(workouts: workouts);
    final updatedResult = currentResult.copyWith(trainingMenu: updatedMenu);

    _updateHistoryAndSave(updatedResult);
  }

  /// ✅ 食事の記録を更新する (Enum対応)
  void updateDietStatus(int dayIndex, DietStatus status) {
    final currentResult = state.currentResult;
    if (currentResult == null) return;

    final newAdherence = List<DietStatus>.from(
      currentResult.nutritionPlan.weeklyAdherence,
    );

    if (dayIndex >= 0 && dayIndex < newAdherence.length) {
      newAdherence[dayIndex] = status;
    }

    final updatedNutrition = currentResult.nutritionPlan.copyWith(
      weeklyAdherence: newAdherence,
    );
    final updatedResult = currentResult.copyWith(
      nutritionPlan: updatedNutrition,
    );

    _updateHistoryAndSave(updatedResult);
  }

  /// 🚀 実績を反映して翌週を作成
  Future<void> generateNextWeekPlan() async {
    if (state.lastInput == null || state.currentResult == null) return;

    final currentPlanJson = jsonEncode(state.currentResult!.toJson());

    // 📊 食事ログの集計
    final dietLog = state.currentResult!.nutritionPlan.weeklyAdherence;
    final goodCount = dietLog.where((s) => s == DietStatus.good).length;
    final overCount = dietLog.where((s) => s == DietStatus.over).length;
    final underCount = dietLog.where((s) => s == DietStatus.under).length;

    // AIへのフィードバックプロンプト作成
    final feedbackPrompt = """
    
    [FEEDBACK FROM PREVIOUS WEEK]
    Nutrition Log (7 days):
    - Good (Target met): $goodCount days
    - Over (Ate too much): $overCount days
    - Under (Ate too little): $underCount days
    
    INSTRUCTION FOR NEXT WEEK:
    - If 'Over' count is high (>2): The user is struggling with hunger. Suggest more voluminous low-calorie foods or slightly increase calorie target to be realistic.
    - If 'Under' count is high (>2): The user might be skipping meals. Suggest nutrient-dense foods (smoothies, nuts) to hit targets easily.
    - If 'Good' count is high: Maintain the current strategy or optimize slightly.
    
    Training Status: Please check 'isCompleted' fields in the PREVIOUS PLAN DATA below.
    
    PREVIOUS PLAN DATA:
    $currentPlanJson
    """;

    final nextWeekInput = state.lastInput!.copyWith(
      additionalRequest:
          '${state.lastInput!.additionalRequest} $feedbackPrompt',
    );

    await generatePlan(input: nextWeekInput);
  }

  /// 🔄 履歴リスト内の該当データを更新して保存するヘルパー
  Future<void> _updateHistoryAndSave(PlanResult updatedResult) async {
    final newHistory = List<PlanResult>.from(state.history);
    final index = newHistory.indexOf(state.currentResult!);

    if (index != -1) {
      newHistory[index] = updatedResult;
    } else {
      newHistory.insert(0, updatedResult);
    }

    state = state.copyWith(currentResult: updatedResult, history: newHistory);

    if (state.lastInput != null) {
      await _saveAll(newHistory, state.lastInput!);
    }
  }

  /// 💾 全データ保存
  Future<void> _saveAll(List<PlanResult> history, UserInput input) async {
    final prefs = await SharedPreferences.getInstance();
    final historyList = history.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_historyKey, historyList);
    await prefs.setString(_inputKey, jsonEncode(input.toJson()));
  }

  /// 🗑️ 履歴削除
  Future<void> deletePlan(int index) async {
    if (index < 0 || index >= state.history.length) return;

    final newHistory = List<PlanResult>.from(state.history)..removeAt(index);

    PlanResult? newCurrent = state.currentResult;
    if (newCurrent == state.history[index]) {
      newCurrent = null;
    }

    state = state.copyWith(history: newHistory, currentResult: newCurrent);

    if (state.lastInput != null) {
      await _saveAll(newHistory, state.lastInput!);
    }
  }

  /// 画面リセット
  void clearCurrentResult() {
    state = PlanState(
      isLoading: state.isLoading,
      currentResult: null,
      history: state.history,
      errorMessage: state.errorMessage,
      lastInput: state.lastInput,
    );
  }
}

final planNotifierProvider = StateNotifierProvider<PlanNotifier, PlanState>((
  ref,
) {
  final useCase = ref.watch(planGenerationUseCaseProvider);
  return PlanNotifier(useCase: useCase);
});
