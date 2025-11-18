import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_result.freezed.dart';
part 'plan_result.g.dart';

@freezed
abstract class PlanResult with _$PlanResult {
  const factory PlanResult({
    @JsonKey(fromJson: NutritionPlan.fromJson)
    required NutritionPlan nutritionPlan,
    @JsonKey(fromJson: TrainingMenu.fromJson)
    required TrainingMenu trainingMenu,
  }) = _PlanResult;

  factory PlanResult.fromJson(Map<String, dynamic> json) =>
      _$PlanResultFromJson(json);
}
