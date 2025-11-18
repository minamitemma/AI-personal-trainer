import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_menu.freezed.dart';
part 'training_menu.g.dart';

@freezed
abstract class TrainingMenu with _$TrainingMenu {
  const factory TrainingMenu({
    @Default('') String title,
    @Default('') String duration,
    @Default([]) List<DailyWorkout> workouts,
  }) = _TrainingMenu;

  factory TrainingMenu.fromJson(Map<String, dynamic> json) =>
      _$TrainingMenuFromJson(json);
}

@freezed
abstract class DailyWorkout with _$DailyWorkout {
  const factory DailyWorkout({
    @Default('') String day,
    @Default('') String focus,
    @Default([]) List<Exercise> exercises,
  }) = _DailyWorkout;
  factory DailyWorkout.fromJson(Map<String, dynamic> json) =>
      _$DailyWorkoutFromJson(json);
}

@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    @Default('') String name,
    @Default(0) int sets,
    @Default('') String repsOrDuration,
    @Default('') String rest,
    @Default(false) bool isCompleted,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
