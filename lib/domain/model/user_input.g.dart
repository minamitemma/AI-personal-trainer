// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInput _$UserInputFromJson(Map<String, dynamic> json) => _UserInput(
  planName: json['planName'] as String? ?? '',
  goalType: json['goalType'] as String,
  targetDuration: json['targetDuration'] as String? ?? '',
  goalWeight: (json['goalWeight'] as num?)?.toInt() ?? 0,
  heightCm: (json['heightCm'] as num?)?.toInt() ?? 0,
  weightKg: (json['weightKg'] as num?)?.toInt() ?? 0,
  age: (json['age'] as num?)?.toInt() ?? 0,
  experienceLevel: json['experienceLevel'] as String,
  gymDays: (json['gymDays'] as num?)?.toInt() ?? 0,
  homeDays: (json['homeDays'] as num?)?.toInt() ?? 0,
  benchPressWeight: (json['benchPressWeight'] as num?)?.toInt() ?? 0,
  benchPressReps: (json['benchPressReps'] as num?)?.toInt() ?? 0,
  squatWeight: (json['squatWeight'] as num?)?.toInt() ?? 0,
  squatReps: (json['squatReps'] as num?)?.toInt() ?? 0,
  deadliftWeight: (json['deadliftWeight'] as num?)?.toInt() ?? 0,
  deadliftReps: (json['deadliftReps'] as num?)?.toInt() ?? 0,
  dietRestriction: json['dietRestriction'] as String,
  additionalRequest: json['additionalRequest'] as String? ?? '',
);

Map<String, dynamic> _$UserInputToJson(_UserInput instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'goalType': instance.goalType,
      'targetDuration': instance.targetDuration,
      'goalWeight': instance.goalWeight,
      'heightCm': instance.heightCm,
      'weightKg': instance.weightKg,
      'age': instance.age,
      'experienceLevel': instance.experienceLevel,
      'gymDays': instance.gymDays,
      'homeDays': instance.homeDays,
      'benchPressWeight': instance.benchPressWeight,
      'benchPressReps': instance.benchPressReps,
      'squatWeight': instance.squatWeight,
      'squatReps': instance.squatReps,
      'deadliftWeight': instance.deadliftWeight,
      'deadliftReps': instance.deadliftReps,
      'dietRestriction': instance.dietRestriction,
      'additionalRequest': instance.additionalRequest,
    };
