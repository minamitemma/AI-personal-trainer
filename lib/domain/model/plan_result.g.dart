// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanResult _$PlanResultFromJson(Map<String, dynamic> json) => _PlanResult(
  nutritionPlan: NutritionPlan.fromJson(
    json['nutritionPlan'] as Map<String, dynamic>,
  ),
  trainingMenu: TrainingMenu.fromJson(
    json['trainingMenu'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PlanResultToJson(_PlanResult instance) =>
    <String, dynamic>{
      'nutritionPlan': instance.nutritionPlan,
      'trainingMenu': instance.trainingMenu,
    };
