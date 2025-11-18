import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/sections/plan_result_section.dart';
import 'package:flutter/material.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key, required this.planResult});
  final PlanResult planResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プラン詳細')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: PlanResultSection(
          training: planResult.trainingMenu,
          nutrition: planResult.nutritionPlan,
          goalSummary: planResult.nutritionPlan.goalSummary,
          // 履歴からの表示なのでリセットボタンは不要（空の関数を渡すか、ボタンを隠すフラグを実装してもよい）
          onReset: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
