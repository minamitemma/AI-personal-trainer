import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/sections/plan_result_section.dart'; // 🚨 共通部品をインポート
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanDetailScreen extends ConsumerWidget {
  const PlanDetailScreen({super.key, required this.planResult});
  final PlanResult planResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(title: const Text('プラン詳細')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        // 🚨 ここで共通部品 `PlanResultSection` を再利用するだけ！ 🚨
        child: PlanResultSection(
          training: planResult.trainingMenu,
          nutrition: planResult.nutritionPlan,
          goalSummary: planResult.nutritionPlan.goalSummary,

          // 履歴画面での「リセット」ボタンの挙動
          // -> 作成画面ではないので、「前の画面に戻る」動作にするのが自然
          onReset: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
