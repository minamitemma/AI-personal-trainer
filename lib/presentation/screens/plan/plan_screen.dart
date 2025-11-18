// ファイルパス: lib/presentation/screens/plan/plan_screen.dart

import 'package:ai_personal_trainer/presentation/screens/plan/sections/plan_input_section.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/sections/plan_result_section.dart';
import 'package:ai_personal_trainer/presentation/state/plan_notifier.dart';
import 'package:ai_personal_trainer/presentation/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanScreen extends ConsumerWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Riverpodの状態を監視
    final state = ref.watch(planNotifierProvider);
    final notifier = ref.read(planNotifierProvider.notifier);

    return Scaffold(
      // モダンな背景色
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          // メインのスクロールコンテンツ
          CustomScrollView(
            slivers: [
              // 1. リッチなヘッダー
              SliverAppBar.large(
                title: const Text(
                  'AI Trainer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                expandedHeight: 120,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // 戻るボタンの色を白にする
                iconTheme: const IconThemeData(color: Colors.white),
              ),

              // 2. コンテンツ部分
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // --- エラー表示 ---
                      if (state.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: MaterialBanner(
                            content: Text(state.errorMessage!),
                            backgroundColor: Colors.red.shade100,
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // 必要であればエラーをクリアするメソッドをNotifierに追加して呼ぶ
                                  // notifier.clearError();
                                },
                                child: const Text(
                                  '閉じる',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),

                      // --- メイン表示の切り替え ---
                      // currentResult が null なら「入力画面」、あれば「結果画面」
                      if (state.currentResult == null)
                        PlanInputSection(
                          isLoading: state.isLoading,
                          // 保存された入力データがあれば初期値として渡す
                          initialInput: state.lastInput,
                          onGenerate:
                              (input) => notifier.generatePlan(input: input),
                        )
                      else
                        PlanResultSection(
                          training: state.currentResult!.trainingMenu,
                          nutrition: state.currentResult!.nutritionPlan,
                          goalSummary:
                              state.currentResult!.nutritionPlan.goalSummary,
                          // リセットボタン: 現在の結果表示のみをクリアして入力画面に戻る
                          onReset: () => notifier.clearCurrentResult(),
                        ),

                      const SizedBox(height: 50), // 下部の余白
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 3. ローディングオーバーレイ (画面全体を覆う)
          if (state.isLoading)
            Container(
              // .withOpacity は非推奨のため .withValues を使用
              color: Colors.white.withValues(alpha: 0.9),
              child: const LoadingView(),
            ),
        ],
      ),
    );
  }
}
