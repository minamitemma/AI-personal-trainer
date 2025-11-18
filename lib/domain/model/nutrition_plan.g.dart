// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionPlan _$NutritionPlanFromJson(Map<String, dynamic> json) =>
    _NutritionPlan(
      goalSummary: json['goalSummary'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      dailySummary: NutrientSummary.fromJson(
        json['dailySummary'] as Map<String, dynamic>,
      ),
      meals:
          (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyAdherence:
          (json['weeklyAdherence'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DietStatusEnumMap, e))
              .toList() ??
          const [
            DietStatus.unknown,
            DietStatus.unknown,
            DietStatus.unknown,
            DietStatus.unknown,
            DietStatus.unknown,
            DietStatus.unknown,
            DietStatus.unknown,
          ],
    );

Map<String, dynamic> _$NutritionPlanToJson(_NutritionPlan instance) =>
    <String, dynamic>{
      'goalSummary': instance.goalSummary,
      'duration': instance.duration,
      'dailySummary': instance.dailySummary,
      'meals': instance.meals,
      'weeklyAdherence':
          instance.weeklyAdherence.map((e) => _$DietStatusEnumMap[e]!).toList(),
    };

const _$DietStatusEnumMap = {
  DietStatus.unknown: 'unknown',
  DietStatus.good: 'good',
  DietStatus.over: 'over',
  DietStatus.under: 'under',
};

_Meal _$MealFromJson(Map<String, dynamic> json) => _Meal(
  type: json['type'] as String? ?? '',
  time: json['time'] as String? ?? '',
  description: json['description'] as String? ?? '',
  mealNutrients: NutrientSummary.fromJson(
    json['mealNutrients'] as Map<String, dynamic>,
  ),
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$MealToJson(_Meal instance) => <String, dynamic>{
  'type': instance.type,
  'time': instance.time,
  'description': instance.description,
  'mealNutrients': instance.mealNutrients,
  'isCompleted': instance.isCompleted,
};

_NutrientSummary _$NutrientSummaryFromJson(Map<String, dynamic> json) =>
    _NutrientSummary(
      calories: (json['calories'] as num?)?.toInt() ?? 0,
      proteinGrams: (json['protein_g'] as num?)?.toInt() ?? 0,
      fatGrams: (json['fat_g'] as num?)?.toInt() ?? 0,
      carbsGrams: (json['carbs_g'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NutrientSummaryToJson(_NutrientSummary instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein_g': instance.proteinGrams,
      'fat_g': instance.fatGrams,
      'carbs_g': instance.carbsGrams,
    };
