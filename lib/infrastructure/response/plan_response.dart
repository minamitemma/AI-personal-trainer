import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_response.freezed.dart';
part 'plan_response.g.dart';

@freezed
abstract class PlanResponse with _$PlanResponse {
  const factory PlanResponse({
    @JsonKey(name: 'weekly_workouts')
    @Default([])
    List<Map<String, dynamic>> trainingMenuJson,
    @JsonKey(name: 'sample_meals')
    @Default([])
    List<Map<String, dynamic>> nutritionPlanJson,
    @JsonKey(name: 'plan_id') @Default('') String planId,
    @JsonKey(name: 'goal_summary') @Default('') String goalSummary,
    @JsonKey(name: 'calorieTarget') @Default(0) int calorieTarget,
    @JsonKey(name: 'macronutrients')
    @Default({})
    Map<String, dynamic> macronutrients,
  }) = _PlanResponse;

  factory PlanResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanResponseFromJson(json);
}
