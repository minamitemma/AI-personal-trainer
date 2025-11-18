// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingMenu _$TrainingMenuFromJson(Map<String, dynamic> json) =>
    _TrainingMenu(
      title: json['title'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      workouts:
          (json['workouts'] as List<dynamic>?)
              ?.map((e) => DailyWorkout.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrainingMenuToJson(_TrainingMenu instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'workouts': instance.workouts,
    };

_DailyWorkout _$DailyWorkoutFromJson(Map<String, dynamic> json) =>
    _DailyWorkout(
      day: json['day'] as String? ?? '',
      focus: json['focus'] as String? ?? '',
      exercises:
          (json['exercises'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DailyWorkoutToJson(_DailyWorkout instance) =>
    <String, dynamic>{
      'day': instance.day,
      'focus': instance.focus,
      'exercises': instance.exercises,
    };

_Exercise _$ExerciseFromJson(Map<String, dynamic> json) => _Exercise(
  name: json['name'] as String? ?? '',
  sets: (json['sets'] as num?)?.toInt() ?? 0,
  repsOrDuration: json['repsOrDuration'] as String? ?? '',
  rest: json['rest'] as String? ?? '',
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$ExerciseToJson(_Exercise instance) => <String, dynamic>{
  'name': instance.name,
  'sets': instance.sets,
  'repsOrDuration': instance.repsOrDuration,
  'rest': instance.rest,
  'isCompleted': instance.isCompleted,
};
