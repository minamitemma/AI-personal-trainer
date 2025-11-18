// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanResponse _$PlanResponseFromJson(Map<String, dynamic> json) =>
    _PlanResponse(
      trainingMenuJson:
          (json['weekly_workouts'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      nutritionPlanJson:
          (json['sample_meals'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      planId: json['plan_id'] as String? ?? '',
      goalSummary: json['goal_summary'] as String? ?? '',
      calorieTarget: (json['calorieTarget'] as num?)?.toInt() ?? 0,
      macronutrients:
          json['macronutrients'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$PlanResponseToJson(_PlanResponse instance) =>
    <String, dynamic>{
      'weekly_workouts': instance.trainingMenuJson,
      'sample_meals': instance.nutritionPlanJson,
      'plan_id': instance.planId,
      'goal_summary': instance.goalSummary,
      'calorieTarget': instance.calorieTarget,
      'macronutrients': instance.macronutrients,
    };
