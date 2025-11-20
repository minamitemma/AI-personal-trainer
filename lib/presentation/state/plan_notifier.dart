// ファイルパス: lib/presentation/state/plan_notifier.dart

import 'dart:convert';

// 🚨 追加: 並び順をアルファベット順に修正
import 'package:ai_personal_trainer/domain/model/daily_log.dart';
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
    this.dailyLogs = const [],
    this.errorMessage,
    this.lastInput,
  });
  final bool isLoading;
  final PlanResult? currentResult;
  final List<PlanResult> history;
  final List<DailyLog> dailyLogs;
  final String? errorMessage;
  final UserInput? lastInput;

  PlanState copyWith({
    bool? isLoading,
    PlanResult? currentResult,
    List<PlanResult>? history,
    List<DailyLog>? dailyLogs,
    String? errorMessage,
    UserInput? lastInput,
  }) {
    return PlanState(
      isLoading: isLoading ?? this.isLoading,
      currentResult: currentResult ?? this.currentResult,
      history: history ?? this.history,
      dailyLogs: dailyLogs ?? this.dailyLogs,
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
  static const _logsKey = 'saved_daily_logs';

  /// 💾 全データの読み込み
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. AIプラン履歴
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

    // 2. 手動記録ログ
    List<DailyLog> loadedLogs = [];
    final logsJsonList = prefs.getStringList(_logsKey);
    if (logsJsonList != null) {
      try {
        loadedLogs =
            logsJsonList
                .map(
                  (str) => DailyLog.fromJson(
                    jsonDecode(str) as Map<String, dynamic>,
                  ),
                )
                .toList();
      } catch (_) {}
    }

    // 3. 最後の入力データ
    UserInput? loadedInput;
    final inputJson = prefs.getString(_inputKey);
    if (inputJson != null) {
      try {
        loadedInput = UserInput.fromJson(
          jsonDecode(inputJson) as Map<String, dynamic>,
        );
      } catch (_) {}
    }

    state = state.copyWith(
      history: loadedHistory,
      dailyLogs: loadedLogs,
      lastInput: loadedInput,
    );
  }

  /// 🚀 プラン生成
  Future<void> generatePlan({required UserInput input}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final result = await _useCase.execute(input);

      // 履歴の先頭に追加
      final newHistory = [result, ...state.history];
      await _saveHistoryAndInput(newHistory, input);

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

  Future<void> remakeCurrentPlan(String feedback) async {
    // 直前の入力データがない場合は実行できない
    if (state.lastInput == null) return;

    // 修正指示用の強力なプロンプトを作成
    final modificationPrompt = """
    
    [MODIFICATION REQUEST]
    The user is not satisfied with the previous plan and wants to modify it.
    
    User's Feedback:
    "$feedback"
    
    INSTRUCTION:
    Regenerate the plan based on the original parameters, but STRICTLY apply the user's feedback above.
    """;

    // 前回の入力データに、修正指示を追記する
    // (前の additionalRequest も残すことで、文脈を維持する)
    final newInput = state.lastInput!.copyWith(
      additionalRequest:
          '${state.lastInput!.additionalRequest} $modificationPrompt',
    );

    // 再生成を実行 (履歴には新しいプランとして追加される)
    await generatePlan(input: newInput);
  }

  /// ✅ トレーニングの完了切り替え
  void toggleExerciseCompletion(int workoutIndex, int exerciseIndex) {
    final currentResult = state.currentResult;
    if (currentResult == null) {
      return;
    }

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

    _updateCurrentInHistoryAndSave(updatedResult);
  }

  /// ✅ 食事ステータスの更新 (DietStatus)
  void updateDietStatus(int dayIndex, DietStatus status) {
    final currentResult = state.currentResult;
    if (currentResult == null) {
      return;
    }

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

    _updateCurrentInHistoryAndSave(updatedResult);
  }

  /// 🚀 実績を反映して翌週を作成
  Future<void> generateNextWeekPlan() async {
    if (state.lastInput == null || state.currentResult == null) {
      return;
    }

    // 🚨 修正: 変数を使用していなかった問題を修正 🚨
    final currentPlanJson = jsonEncode(state.currentResult!.toJson());

    // 食事ログの集計
    final dietLog = state.currentResult!.nutritionPlan.weeklyAdherence;
    final goodCount = dietLog.where((s) => s == DietStatus.good).length;
    final overCount = dietLog.where((s) => s == DietStatus.over).length;
    final underCount = dietLog.where((s) => s == DietStatus.under).length;

    final feedbackPrompt = """
    
    [FEEDBACK FROM PREVIOUS WEEK]
    Nutrition Log (7 days):
    - Good (Target met): $goodCount days
    - Over (Ate too much): $overCount days
    - Under (Ate too little): $underCount days
    
    INSTRUCTION FOR NEXT WEEK:
    - If 'Over' count is high (>2): Suggest more voluminous low-calorie foods or slightly increase calorie target.
    - If 'Under' count is high (>2): Suggest nutrient-dense foods.
    
    Training Status: Please check 'isCompleted' fields in the PREVIOUS PLAN DATA below.
    
    PREVIOUS PLAN DATA:
    $currentPlanJson  <-- ここで使用されていることを確認！
    """;

    final nextWeekInput = state.lastInput!.copyWith(
      additionalRequest:
          '${state.lastInput!.additionalRequest} $feedbackPrompt',
    );

    await generatePlan(input: nextWeekInput);
  }

  /// 🔄 履歴リスト内の現在表示中のデータを更新して保存するヘルパー
  Future<void> _updateCurrentInHistoryAndSave(PlanResult updatedResult) async {
    final newHistory = List<PlanResult>.from(state.history);
    final index = newHistory.indexOf(state.currentResult!);

    if (index != -1) {
      newHistory[index] = updatedResult;
    } else {
      newHistory.insert(0, updatedResult);
    }

    state = state.copyWith(currentResult: updatedResult, history: newHistory);

    if (state.lastInput != null) {
      await _saveHistoryAndInput(newHistory, state.lastInput!);
    }
  }

  /// 🗑️ AIプラン履歴の削除
  Future<void> deletePlan(int index) async {
    if (index < 0 || index >= state.history.length) {
      return; // 🚨 {} で囲む
    }

    final newHistory = List<PlanResult>.from(state.history)..removeAt(index);

    PlanResult? newCurrent = state.currentResult;
    // 削除したものが現在表示中のものならクリア
    if (state.history.length > index && newCurrent == state.history[index]) {
      newCurrent = null;
    }

    state = state.copyWith(history: newHistory, currentResult: newCurrent);

    if (state.lastInput != null) {
      await _saveHistoryAndInput(newHistory, state.lastInput!);
    }
  }

  /// 画面リセット（入力画面に戻る）
  void clearCurrentResult() {
    state = PlanState(
      isLoading: state.isLoading,
      currentResult: null,
      history: state.history,
      dailyLogs: state.dailyLogs,
      errorMessage: state.errorMessage,
      lastInput: state.lastInput,
    );
  }

  // ==========================================
  // 手動記録 (DailyLog) 関連
  // ==========================================

  /// 📝 手動記録を追加・更新する
  Future<void> addDailyLog(DailyLog log) async {
    final newLogs = List<DailyLog>.from(state.dailyLogs);

    // 同じ日の記録があるか探す (年月日の一致)
    final index = newLogs.indexWhere(
      (existing) =>
          existing.date.year == log.date.year &&
          existing.date.month == log.date.month &&
          existing.date.day == log.date.day,
    );

    if (index != -1) {
      newLogs[index] = log; // 上書き
    } else {
      newLogs.add(log); // 新規追加
    }

    // 日付順にソート
    newLogs.sort((a, b) => a.date.compareTo(b.date));

    state = state.copyWith(dailyLogs: newLogs);
    await _saveLogs(newLogs);
  }

  /// 🔍 指定した日付のログを取得する
  DailyLog? getLogForDate(DateTime date) {
    try {
      return state.dailyLogs.firstWhere(
        (log) =>
            log.date.year == date.year &&
            log.date.month == date.month &&
            log.date.day == date.day,
      );
    } catch (_) {
      return null;
    }
  }

  /// 🗑️ 手動記録を削除
  Future<void> deleteDailyLog(DateTime date) async {
    final newLogs =
        state.dailyLogs
            .where(
              (l) =>
                  !(l.date.year == date.year &&
                      l.date.month == date.month &&
                      l.date.day == date.day),
            )
            .toList();

    state = state.copyWith(dailyLogs: newLogs);
    await _saveLogs(newLogs);
  }

  // ==========================================
  // 永続化ヘルパー
  // ==========================================

  /// 💾 履歴と入力を保存
  Future<void> _saveHistoryAndInput(
    List<PlanResult> history,
    UserInput input,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final historyList = history.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_historyKey, historyList);
    await prefs.setString(_inputKey, jsonEncode(input.toJson()));
  }

  /// 💾 手動ログを保存
  Future<void> _saveLogs(List<DailyLog> logs) async {
    final prefs = await SharedPreferences.getInstance();
    final list = logs.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_logsKey, list);
  }
}

// --------------------------------------------------

final planNotifierProvider = StateNotifierProvider<PlanNotifier, PlanState>((
  ref,
) {
  final useCase = ref.watch(planGenerationUseCaseProvider);
  return PlanNotifier(useCase: useCase);
});
