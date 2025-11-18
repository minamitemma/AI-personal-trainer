import 'package:ai_personal_trainer/domain/model/diet_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_plan.freezed.dart';
part 'nutrition_plan.g.dart';

@freezed
abstract class NutritionPlan with _$NutritionPlan {
  const factory NutritionPlan({
    @Default('') String goalSummary,
    @Default('') String duration,
    required NutrientSummary dailySummary,
    @Default([]) List<Meal> meals,
    @Default([
      DietStatus.unknown,
      DietStatus.unknown,
      DietStatus.unknown,
      DietStatus.unknown,
      DietStatus.unknown,
      DietStatus.unknown,
      DietStatus.unknown,
    ])
    List<DietStatus> weeklyAdherence,
  }) = _NutritionPlan;
  factory NutritionPlan.fromJson(Map<String, dynamic> json) =>
      _$NutritionPlanFromJson(json);
}

@freezed
abstract class Meal with _$Meal {
  const factory Meal({
    @Default('') String type,
    @Default('') String time,
    @Default('') String description,
    required NutrientSummary mealNutrients,

    @Default(false) bool isCompleted,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}

@freezed
abstract class NutrientSummary with _$NutrientSummary {
  const factory NutrientSummary({
    @Default(0) int calories,
    @JsonKey(name: 'protein_g') @Default(0) int proteinGrams,
    @JsonKey(name: 'fat_g') @Default(0) int fatGrams,
    @JsonKey(name: 'carbs_g') @Default(0) int carbsGrams,
  }) = _NutrientSummary;

  factory NutrientSummary.fromJson(Map<String, dynamic> json) =>
      _$NutrientSummaryFromJson(json);
}
