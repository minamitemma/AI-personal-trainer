// lib/domain/model/plan_result.dart

import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart'; // 🚨 追加
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_result.freezed.dart';
part 'plan_result.g.dart';

@freezed
abstract class PlanResult with _$PlanResult {
  const factory PlanResult({
    required NutritionPlan nutritionPlan,
    required TrainingMenu trainingMenu,
    required DateTime createdAt,
    required UserInput inputData,
  }) = _PlanResult;

  factory PlanResult.fromJson(Map<String, dynamic> json) =>
      _$PlanResultFromJson(json);
}
