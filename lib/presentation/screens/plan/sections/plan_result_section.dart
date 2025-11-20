// ファイルパス: lib/presentation/screens/plan/sections/plan_result_section.dart

import 'package:ai_personal_trainer/domain/constant/exercise_master.dart';
import 'package:ai_personal_trainer/domain/model/diet_status.dart';
import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:ai_personal_trainer/domain/model/training_menu.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/components/section_header.dart';
import 'package:ai_personal_trainer/presentation/state/plan_notifier.dart';
import 'package:ai_personal_trainer/presentation/widgets/macro_chart.dart';
import 'package:ai_personal_trainer/presentation/widgets/training_timer_dialog.dart';
import 'package:ai_personal_trainer/presentation/widgets/video_launcher_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanResultSection extends ConsumerWidget {
  const PlanResultSection({
    super.key,
    required this.training,
    required this.nutrition,
    required this.goalSummary,
    required this.onReset,
  });
  final TrainingMenu training;
  final NutritionPlan nutrition;
  final String goalSummary;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(planNotifierProvider.notifier);

    return Column(
      children: [
        // --- 1. 成功メッセージ ---
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  training.title.isEmpty ? 'プラン作成完了' : training.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // --- 2. AIからのアドバイス ---
        if (goalSummary.isNotEmpty)
          Card(
            elevation: 2,
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.blue.shade100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.orange.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'AIからのアドバイス',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    goalSummary,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

        const SizedBox(height: 10),

        // --- 3. アクションボタン ---
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () => _copyToClipboard(context),
              icon: const Icon(Icons.copy, size: 20),
              label: const Text('テキストでコピー'),
            ),
            TextButton.icon(
              onPressed: onReset,
              icon: const Icon(
                Icons.delete_outline,
                size: 20,
                color: Colors.red,
              ),
              label: const Text('リセット', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // --- 4. マクロ栄養素カード ---
        _buildMacroNutrientCard(),
        const SizedBox(height: 20),

        // --- 5. トレーニングリスト ---
        const SectionHeader(title: '🏋️ 今週のトレーニング', icon: Icons.fitness_center),
        const SizedBox(height: 10),
        ...training.workouts.asMap().entries.map((entry) {
          final wIndex = entry.key;
          final workout = entry.value;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF6A11CB).withValues(alpha: 0.1),
                child: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF6A11CB),
                  size: 20,
                ),
              ),
              title: Text(
                workout.day,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(workout.focus),
              children:
                  workout.exercises.asMap().entries.map((exEntry) {
                    final eIndex = exEntry.key;
                    final ex = exEntry.value;

                    return Card(
                      elevation: 0,
                      color:
                          ex.isCompleted ? Colors.grey.shade100 : Colors.white,
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 0,
                          right: 8,
                        ),
                        leading: Checkbox(
                          value: ex.isCompleted,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            notifier.toggleExerciseCompletion(wIndex, eIndex);
                          },
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ex.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration:
                                    ex.isCompleted
                                        ? TextDecoration.lineThrough
                                        : null,
                                color:
                                    ex.isCompleted
                                        ? Colors.grey
                                        : Colors.black87,
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final master = ExerciseMaster.findByName(
                                  ex.name,
                                );
                                if (master != null && master.name != ex.name) {
                                  return Text(
                                    '(${master.name})',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.blueGrey,
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                        subtitle: Text(
                          '${ex.repsOrDuration} × ${ex.sets} Sets\nRest: ${ex.rest}',
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                ex.isCompleted ? Colors.grey : Colors.black54,
                          ),
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.redAccent,
                                size: 28,
                              ),
                              tooltip: '動画でフォームを確認',
                              onPressed: () {
                                VideoLauncherHelper.launchVideoSearch(
                                  context,
                                  ex.name,
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.timer,
                                color: Color(0xFF6A11CB),
                                size: 28,
                              ),
                              tooltip: '休憩タイマー',
                              onPressed: () => _showTimer(context, ex.rest),
                            ),
                          ],
                        ),
                        onTap: () {
                          notifier.toggleExerciseCompletion(wIndex, eIndex);
                        },
                      ),
                    );
                  }).toList(),
            ),
          );
        }),

        const SizedBox(height: 20),

        // --- 6. 食事プラン（見本） ---
        const SectionHeader(title: '🥗 食事プラン (見本)', icon: Icons.restaurant),
        const SizedBox(height: 10),
        ...nutrition.meals.map(
          (meal) => Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.fastfood, color: Colors.orange),
              ),
              title: Text(
                '${meal.type} (${meal.time})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(meal.description),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // --- 7. 週間食事ログ ---
        const SectionHeader(title: '📅 今週の食事ログ', icon: Icons.calendar_month),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'その日の食事量を記録しましょう（タップして選択）',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(nutrition.weeklyAdherence.length, (
                    index,
                  ) {
                    final status = nutrition.weeklyAdherence[index];
                    Color color;
                    IconData icon;
                    switch (status) {
                      case DietStatus.good:
                        color = Colors.green;
                        icon = Icons.thumb_up;
                        break;
                      case DietStatus.over:
                        color = Colors.orange;
                        icon = Icons.warning_amber;
                        break;
                      case DietStatus.under:
                        color = Colors.blue;
                        icon = Icons.trending_down;
                        break;
                      case DietStatus.unknown:
                        color = Colors.grey.shade300;
                        icon = Icons.add;
                        break;
                    }

                    return PopupMenuButton<DietStatus>(
                      tooltip: 'Day ${index + 1} の記録',
                      onSelected: (selectedStatus) {
                        notifier.updateDietStatus(index, selectedStatus);
                      },
                      itemBuilder:
                          (context) => [
                            _buildMenuItem(
                              DietStatus.good,
                              Icons.thumb_up,
                              Colors.green,
                            ),
                            _buildMenuItem(
                              DietStatus.over,
                              Icons.warning_amber,
                              Colors.orange,
                            ),
                            _buildMenuItem(
                              DietStatus.under,
                              Icons.trending_down,
                              Colors.blue,
                            ),
                            const PopupMenuDivider(),
                            _buildMenuItem(
                              DietStatus.unknown,
                              Icons.close,
                              Colors.grey,
                            ),
                          ],
                      child: Column(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color:
                                  status == DietStatus.unknown
                                      ? Colors.grey.shade50
                                      : color.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    status == DietStatus.unknown
                                        ? Colors.grey.shade300
                                        : color,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              icon,
                              size: 24,
                              color:
                                  status == DietStatus.unknown
                                      ? Colors.grey
                                      : color,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Day ${index + 1}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            status.label,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        // --- 8. 🚨 作り直しボタン (ここに追加) 🚨 ---
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: () => _showRemakeDialog(context, ref),
            icon: const Icon(Icons.refresh, color: Colors.orange),
            label: const Text(
              '要望を伝えて作り直す 🔄',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.orange, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // --- 9. 翌週プラン作成ボタン ---
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () async {
              await notifier.generateNextWeekPlan();
            },
            icon: const Icon(Icons.next_plan, color: Colors.white),
            label: const Text(
              '実績を反映して翌週を作成 ➡️',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6A11CB),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 50),
      ],
    );
  }

  // --- ヘルパーメソッド ---

  // 🚨 追加: 作り直しダイアログ
  void _showRemakeDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.edit_note, color: Colors.orange),
                SizedBox(width: 8),
                Text('プランの修正', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '現在の条件をベースに、変更したい点だけを入力してください。',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: '例: 筋トレのセット数を減らして。\n例: 朝食はパン派にして。',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('キャンセル'),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (controller.text.trim().isNotEmpty) {
                    Navigator.pop(ctx);
                    // Notifierを呼んで作り直し
                    final notifier = ref.read(planNotifierProvider.notifier);
                    await notifier.remakeCurrentPlan(controller.text);
                  }
                },
                icon: const Icon(Icons.refresh),
                label: const Text('作り直す'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
    );
  }

  // タイマー起動
  void _showTimer(BuildContext context, String restString) {
    final RegExp regExp = RegExp(r'(\d+)');
    final match = regExp.firstMatch(restString);
    int seconds = 60;
    if (match != null) {
      seconds = int.tryParse(match.group(0)!) ?? 60;
    }
    showDialog(
      context: context,
      builder: (context) => TrainingTimerDialog(initialSeconds: seconds),
    );
  }

  PopupMenuItem<DietStatus> _buildMenuItem(
    DietStatus status,
    IconData icon,
    Color color,
  ) {
    return PopupMenuItem<DietStatus>(
      value: status,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(
            status.label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroNutrientCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Daily Nutrition Target',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            MacroNutrientChart(nutrients: nutrition.dailySummary),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _macroItem(
                  'Protein',
                  '${nutrition.dailySummary.proteinGrams}g',
                  Colors.redAccent,
                ),
                _macroItem(
                  'Fats',
                  '${nutrition.dailySummary.fatGrams}g',
                  Colors.orangeAccent,
                ),
                _macroItem(
                  'Carbs',
                  '${nutrition.dailySummary.carbsGrams}g',
                  Colors.greenAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _macroItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Container(height: 4, width: 40, color: color.withValues(alpha: 0.3)),
      ],
    );
  }

  void _copyToClipboard(BuildContext context) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln('【AIパーソナルトレーナーの提案プラン】');
    buffer.writeln('--------------------------------');
    buffer.writeln('■ プラン名: ${training.title}');
    buffer.writeln('期間: ${training.duration}');

    if (goalSummary.isNotEmpty) {
      buffer.writeln('');
      buffer.writeln('💡 AIからのアドバイス:');
      buffer.writeln(goalSummary);
    }
    buffer.writeln('');
    buffer.writeln('■ 1日の栄養目標');
    buffer.writeln('カロリー: ${nutrition.dailySummary.calories} kcal');
    buffer.writeln('P (タンパク質): ${nutrition.dailySummary.proteinGrams}g');
    buffer.writeln('F (脂質): ${nutrition.dailySummary.fatGrams}g');
    buffer.writeln('C (炭水化物): ${nutrition.dailySummary.carbsGrams}g');
    buffer.writeln('');
    buffer.writeln('■ トレーニングメニュー');
    if (training.workouts.isEmpty) {
      buffer.writeln('（データなし）');
    } else {
      for (var workout in training.workouts) {
        buffer.writeln('【${workout.day}】 テーマ: ${workout.focus}');
        for (var ex in workout.exercises) {
          final status = ex.isCompleted ? '✅' : '⬜';
          buffer.writeln('  $status ${ex.name}');
          buffer.writeln(
            '    ${ex.repsOrDuration} × ${ex.sets}セット (休憩: ${ex.rest})',
          );
        }
        buffer.writeln('');
      }
    }
    // ... (コピーロジックの続きは省略。変更なし) ...

    Clipboard.setData(ClipboardData(text: buffer.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('プランをクリップボードにコピーしました！📋'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
