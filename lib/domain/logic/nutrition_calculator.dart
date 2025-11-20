// ファイルパス: lib/domain/logic/nutrition_calculator.dart

import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';

class NutritionCalculator {
  /// ユーザー入力に基づき、目標とする栄養素を計算する
  static NutrientSummary calculateTarget(UserInput input) {
    // 1. 基礎代謝 (BMR) の計算: Mifflin-St Jeor式
    final double bmr =
        (10 * input.weightKg) + (6.25 * input.heightCm) - (5 * input.age) + 5;

    // 2. 活動代謝 (TDEE) の計算
    final totalDays = input.gymDays + input.homeDays;
    double activityMultiplier;

    // 🚨 修正: if文をブロック { } で囲む
    if (totalDays == 0) {
      activityMultiplier = 1.2; // ほぼ運動しない
    } else if (totalDays <= 2) {
      activityMultiplier = 1.375; // 週1-2回
    } else if (totalDays <= 4) {
      activityMultiplier = 1.55; // 週3-4回
    } else if (totalDays <= 6) {
      activityMultiplier = 1.725; // 週5-6回
    } else {
      activityMultiplier = 1.9; // 毎日・激しい
    }

    final double tdee = bmr * activityMultiplier;

    // 3. 目標設定によるカロリー調整
    double targetCalories = tdee;

    switch (input.goalType) {
      case '減量':
        targetCalories = tdee - 500;
        // 🚨 修正: if文をブロック { } で囲む
        if (targetCalories < bmr) {
          targetCalories = bmr;
        }
        break;
      case '筋肥大':
        targetCalories = tdee + 300;
        break;
      case '健康維持':
      case 'アスリート':
      default:
        targetCalories = tdee;
        break;
    }

    // 4. PFCバランスの計算
    // タンパク質(P): 体重 x 2g
    final int proteinGrams = (input.weightKg * 2.0).round();
    final int proteinCal = proteinGrams * 4;

    // 脂質(F): 総カロリーの 25%
    final int fatCal = (targetCalories * 0.25).round();
    final int fatGrams = (fatCal / 9).round();

    // 炭水化物(C): 残り
    int remainingCal = targetCalories.toInt() - proteinCal - fatCal;

    // 🚨 修正: if文をブロック { } で囲む
    if (remainingCal < 0) {
      remainingCal = 0;
    }
    final int carbsGrams = (remainingCal / 4).round();

    return NutrientSummary(
      calories: targetCalories.round(),
      proteinGrams: proteinGrams,
      fatGrams: fatGrams,
      carbsGrams: carbsGrams,
    );
  }
}
