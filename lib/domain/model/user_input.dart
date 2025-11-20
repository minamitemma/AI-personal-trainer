import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input.freezed.dart';
part 'user_input.g.dart';

@freezed
abstract class UserInput with _$UserInput {
  const UserInput._();
  const factory UserInput({
    @Default('') String planName,
    required String goalType,
    @Default('') String targetDuration,
    @Default(0) int goalWeight,
    @Default(0) int heightCm,
    @Default(0) int weightKg,
    @Default(0) int age,
    required String experienceLevel,
    @Default(0) int gymDays,
    @Default(0) int homeDays,
    @Default(0) int benchPressWeight,
    @Default(0) int benchPressReps,

    @Default(0) int squatWeight,
    @Default(0) int squatReps,

    @Default(0) int deadliftWeight,
    @Default(0) int deadliftReps,
    required String dietRestriction,
    @Default('') String additionalRequest,
  }) = _UserInput;

  factory UserInput.fromJson(Map<String, dynamic> json) =>
      _$UserInputFromJson(json);
  // 🚨 追加: 推定1RMを計算するロジック (Epleyの公式)
  int get estimatedBenchPress1rm =>
      _calculate1RM(benchPressWeight, benchPressReps);
  int get estimatedSquat1rm => _calculate1RM(squatWeight, squatReps);
  int get estimatedDeadlift1rm => _calculate1RM(deadliftWeight, deadliftReps);

  int _calculate1RM(int weight, int reps) {
    if (weight <= 0 || reps <= 0) return 0;
    if (reps == 1) return weight;
    // Epley Formula: weight * (1 + reps / 30)
    return (weight * (1 + reps / 30.0)).round();
  }
}
