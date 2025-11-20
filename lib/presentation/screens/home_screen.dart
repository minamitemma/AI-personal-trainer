// ファイルパス: lib/presentation/screens/home_screen.dart

import 'package:ai_personal_trainer/presentation/screens/history_screen.dart';
import 'package:ai_personal_trainer/presentation/screens/list/exercise_list_screen.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/plan_screen.dart';
import 'package:ai_personal_trainer/presentation/screens/records/records_screen.dart';
import 'package:ai_personal_trainer/presentation/state/plan_notifier.dart';
import 'package:ai_personal_trainer/presentation/widgets/food_analysis_helper.dart'; // 🚨 追加: 共通の解析ロジック
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'AI Personal Trainer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // 画面からはみ出ないようにスクロール可能に
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'あなたのフィットネスを\nAIがサポートします',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30), // 間隔を少し調整
              // 1. 新規作成ボタン
              _MenuCard(
                icon: Icons.add_circle_outline,
                title: '新しいプランを作成',
                subtitle: 'AIがあなただけのメニューを考案',
                color: const Color(0xFF2575FC),
                onTap: () {
                  // 前の結果をクリアしてから遷移
                  ref.read(planNotifierProvider.notifier).clearCurrentResult();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlanScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 2. 履歴ボタン
              _MenuCard(
                icon: Icons.history,
                title: '保存したプランを見る',
                subtitle: '過去に作成したプランを確認',
                color: Colors.orangeAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 3. 記録ボタン
              _MenuCard(
                icon: Icons.bar_chart,
                title: '自分の記録を見る',
                subtitle: '体重推移と継続ログを確認',
                color: Colors.purpleAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecordsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 4. 🚨 追加: 食事解析ボタン 🚨
              _MenuCard(
                icon: Icons.camera_alt,
                title: '食事を写真で解析',
                subtitle: 'AIがカロリーとPFCを推定',
                color: Colors.green,
                onTap: () {
                  // 共通関数を呼ぶだけ！
                  showFoodAnalysisDialog(context, ref);
                },
              ),

              const SizedBox(height: 16),

              // 5. 🚨 追加: 種目リストボタン 🚨
              _MenuCard(
                icon: Icons.list_alt,
                title: 'トレーニング種目一覧',
                subtitle: '動画確認やリクエスト用に検索',
                color: Colors.blueGrey,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExerciseListScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withValues(alpha: 0.1),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
