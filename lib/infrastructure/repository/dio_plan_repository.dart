// ファイルパス: lib/infrastructure/repository/dio_plan_repository.dart

// Domain Layers
import 'package:ai_personal_trainer/domain/constant/exercise_master.dart';
import 'package:ai_personal_trainer/domain/logic/nutrition_calculator.dart';
import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/domain/repository/plan_repository.dart';
// Infrastructure Layers
import 'package:ai_personal_trainer/infrastructure/api_client/plan_api_client.dart';
import 'package:ai_personal_trainer/infrastructure/response/plan_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_plan_repository.g.dart';

/// PlanRepositoryの具象実装クラス
class DioPlanRepository implements PlanRepository {
  DioPlanRepository({required PlanApiClient apiClient})
    : _apiClient = apiClient;
  final PlanApiClient _apiClient;

  @override
  Future<PlanResult> generatePlan(UserInput input) async {
    try {
      // 1. APIクライアントを呼び出し
      final PlanResponse responseDto = await _apiClient.generatePlan(
        input: input,
      );

      // 2. TrainingMenu の構築 (ID -> 正式名称への変換)
      final workouts =
          responseDto.trainingMenuJson.map((dayJson) {
            final exercisesJson =
                (dayJson['exercises'] as List<dynamic>?) ?? [];

            final exercises =
                exercisesJson.map((exJson) {
                  final Map<String, dynamic> exMap =
                      exJson as Map<String, dynamic>;

                  // AIが返した名前 (IDの可能性あり)
                  final String exerciseIdOrName =
                      exMap['name'] as String? ?? '';

                  // マスターデータを検索
                  final master = ExerciseMaster.findById(exerciseIdOrName);

                  // マスターにあれば正式名称、なければそのまま
                  final displayName = master?.name ?? exerciseIdOrName;

                  // Exerciseモデルを作成
                  return Exercise.fromJson(exMap).copyWith(name: displayName);
                }).toList();

            return DailyWorkout.fromJson(
              dayJson,
            ).copyWith(exercises: exercises);
          }).toList();

      // プラン名設定
      final String finalTitle =
          input.planName.isNotEmpty ? input.planName : 'AI推奨プラン';

      final trainingMenu = TrainingMenu(
        title: finalTitle,
        duration: '1週間',
        workouts: workouts,
      );

      // 3. NutritionPlan の構築
      final meals =
          responseDto.nutritionPlanJson.map((e) => Meal.fromJson(e)).toList();

      // 🚨 重要: AIの出力値ではなく、ロジックで計算した正確な目標値を採用する
      final calculatedTarget = NutritionCalculator.calculateTarget(input);

      final nutritionPlan = NutritionPlan(
        goalSummary: responseDto.goalSummary,
        duration: '1週間',
        dailySummary: calculatedTarget, // 計算値をセット
        meals: meals,
      );

      // 4. 結果の返却 (グラフ機能用に日時と入力データを付与)
      return PlanResult(
        trainingMenu: trainingMenu,
        nutritionPlan: nutritionPlan,
        createdAt: DateTime.now(),
        inputData: input,
      );
    } on Exception catch (e) {
      throw Exception('Repository Error: $e');
    }
  }
}

// Riverpod Provider
@riverpod
PlanRepository planRepository(Ref ref) {
  final apiClient = ref.watch(planApiClientProvider);
  return DioPlanRepository(apiClient: apiClient);
}
