// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInput _$UserInputFromJson(Map<String, dynamic> json) => _UserInput(
  planName: json['planName'] as String? ?? '',
  goalType: json['goalType'] as String? ?? '',
  goalWeight: (json['goalWeight'] as num?)?.toInt() ?? 0,
  targetDuration: json['targetDuration'] as String? ?? '',
  heightCm: (json['heightCm'] as num?)?.toInt() ?? 0,
  weightKg: (json['weightKg'] as num?)?.toInt() ?? 0,
  age: (json['age'] as num?)?.toInt() ?? 0,
  experienceLevel: json['experienceLevel'] as String? ?? '',
  availableDays: (json['availableDays'] as num?)?.toInt() ?? 0,
  dietRestriction: json['dietRestriction'] as String? ?? '',
  additionalRequest: json['additionalRequest'] as String? ?? '',
);

Map<String, dynamic> _$UserInputToJson(_UserInput instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'goalType': instance.goalType,
      'goalWeight': instance.goalWeight,
      'targetDuration': instance.targetDuration,
      'heightCm': instance.heightCm,
      'weightKg': instance.weightKg,
      'age': instance.age,
      'experienceLevel': instance.experienceLevel,
      'availableDays': instance.availableDays,
      'dietRestriction': instance.dietRestriction,
      'additionalRequest': instance.additionalRequest,
    };
