import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/domain/repository/plan_repository.dart';
import 'package:ai_personal_trainer/infrastructure/api_client/plan_api_client.dart';
import 'package:ai_personal_trainer/infrastructure/response/plan_response.dart';

class DioPlanRepository implements PlanRepository {
  DioPlanRepository({required PlanApiClient apiClient})
    : _apiClient = apiClient;
  final PlanApiClient _apiClient;

  @override
  Future<PlanResult> generatePlan(UserInput input) async {
    try {
      final PlanResponse responseDto = await _apiClient.generatePlan(
        input: input,
      );
      final workouts =
          responseDto.trainingMenuJson
              .map((e) => DailyWorkout.fromJson(e))
              .toList();

      final finalTitle =
          input.planName.isNotEmpty ? input.planName : '${input.goalType}プラン';

      final trainingMenu = TrainingMenu(
        title: finalTitle,
        duration: '1週間',
        workouts: workouts,
      );
      final meals =
          responseDto.nutritionPlanJson.map((e) => Meal.fromJson(e)).toList();
      final macros = responseDto.macronutrients;

      final realSummary = NutrientSummary(
        calories: responseDto.calorieTarget,
        proteinGrams: (macros['proteinGrams'] as num?)?.toInt() ?? 0,
        fatGrams: (macros['fatGrams'] as num?)?.toInt() ?? 0,
        carbsGrams: (macros['carbohydrateGrams'] as num?)?.toInt() ?? 0,
      );

      final nutritionPlan = NutritionPlan(
        goalSummary: responseDto.goalSummary,
        duration: '1週間',
        dailySummary: realSummary,
        meals: meals,
      );

      return PlanResult(
        trainingMenu: trainingMenu,
        nutritionPlan: nutritionPlan,
      );
    } on Exception catch (e) {
      throw Exception('Failed to fetch plan: ${e.toString()}');
    }
  }
}
