import 'package:ai_personal_trainer/presentation/screens/plan_detail_screen.dart';
import 'package:ai_personal_trainer/presentation/state/plan_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 履歴リストを取得
    final history = ref.watch(planNotifierProvider.select((s) => s.history));
    final notifier = ref.read(planNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('保存されたプラン'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body:
          history.isEmpty
              ? const Center(
                child: Text(
                  '保存されたプランはありません',
                  style: TextStyle(color: Colors.grey),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final plan = history[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      title: Text(
                        plan.trainingMenu.title.isEmpty
                            ? 'プラン #${history.length - index}'
                            : plan.trainingMenu.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${plan.trainingMenu.duration} / ${plan.nutritionPlan.dailySummary.calories} kcal',
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // 削除確認ダイアログなどを出すと親切
                          notifier.deletePlan(index);
                        },
                      ),
                      onTap: () {
                        // 詳細画面へ遷移
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PlanDetailScreen(planResult: plan),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
