import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input.freezed.dart';
part 'user_input.g.dart';

@freezed
abstract class UserInput with _$UserInput {
  const factory UserInput({
    @Default('') String planName,
    @Default('') String goalType,
    @Default(0) int goalWeight,
    @Default('') String targetDuration,
    @Default(0) int heightCm,
    @Default(0) int weightKg,
    @Default(0) int age,
    @Default('') String experienceLevel,
    @Default(0) int availableDays,
    @Default('') String dietRestriction,
    @Default('') String additionalRequest,
  }) = _UserInput;
  factory UserInput.fromJson(Map<String, dynamic> json) =>
      _$UserInputFromJson(json);
}
