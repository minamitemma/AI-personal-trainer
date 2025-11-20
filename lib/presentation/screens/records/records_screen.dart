// ファイルパス: lib/presentation/screens/records/records_screen.dart

import 'package:ai_personal_trainer/domain/model/daily_log.dart';
import 'package:ai_personal_trainer/presentation/state/plan_notifier.dart';
import 'package:ai_personal_trainer/presentation/widgets/activity_calendar.dart';
import 'package:ai_personal_trainer/presentation/widgets/weight_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart'; // isSameDay用

class RecordPoint {
  RecordPoint({
    required this.date,
    required this.weight,
    required this.hasActivity,
  });
  final DateTime date;
  final double weight;
  final bool hasActivity;
}

class RecordsScreen extends ConsumerWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(planNotifierProvider);

    // データ統合
    final List<RecordPoint> mergedData = [];

    for (var log in state.dailyLogs) {
      mergedData.add(
        RecordPoint(
          date: log.date,
          weight: log.weight,
          hasActivity: log.isTrained,
        ),
      );
    }

    // ソート
    mergedData.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(title: const Text('自分の記録')),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRecordDialog(context, DateTime.now()),
        backgroundColor: const Color(0xFF6A11CB),
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text(
          '今日の記録',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('📈 体重の推移'),
            const SizedBox(height: 10),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
                child: WeightChart(dataPoints: mergedData),
              ),
            ),

            const SizedBox(height: 30),

            _sectionTitle('📅 アクティビティログ'),
            const SizedBox(height: 10),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // 🚨 カレンダーの日付タップで編集ダイアログを開く
                child: ActivityCalendar(
                  dataPoints: mergedData,
                  onDaySelected: (selectedDay, focusedDay) {
                    _showAddRecordDialog(context, selectedDay);
                  },
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  void _showAddRecordDialog(BuildContext context, DateTime date) {
    showDialog(
      context: context,
      builder: (ctx) => _AddRecordDialog(initialDate: date),
    );
  }
}

// --- 記録用ダイアログ (ConsumerStatefulWidgetに変更) ---
class _AddRecordDialog extends ConsumerStatefulWidget {
  const _AddRecordDialog({required this.initialDate});
  final DateTime initialDate;

  @override
  ConsumerState<_AddRecordDialog> createState() => _AddRecordDialogState();
}

class _AddRecordDialogState extends ConsumerState<_AddRecordDialog> {
  late DateTime _selectedDate;
  double _weight = 60.0;
  bool _isTrained = false;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _weightController = TextEditingController();
    _loadDataForDate(_selectedDate); // 初期データ読み込み
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  // 指定した日付のデータをNotifierから探してセット
  void _loadDataForDate(DateTime date) {
    final existingLog = ref
        .read(planNotifierProvider.notifier)
        .getLogForDate(date);

    if (existingLog != null) {
      setState(() {
        _weight = existingLog.weight;
        _isTrained = existingLog.isTrained;
        _weightController.text = _weight.toString();
      });
    } else {
      // データがない場合、入力欄は初期値(または直前の値)のままにするが、コントローラーは更新
      _weightController.text = _weight.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // その日のデータが存在するか確認（削除ボタン表示用）
    final hasExistingData = ref
        .watch(planNotifierProvider)
        .dailyLogs
        .any((log) => isSameDay(log.date, _selectedDate));

    return AlertDialog(
      title: Text(
        '${DateFormat('M/d').format(_selectedDate)} の記録',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              '日付: ${DateFormat('yyyy/MM/dd').format(_selectedDate)}',
            ),
            trailing: const Icon(
              Icons.calendar_today,
              color: Color(0xFF6A11CB),
            ),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2024),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() => _selectedDate = picked);
                _loadDataForDate(picked); // 日付変更でデータ再読み込み
              }
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: '体重 (kg)',
              border: OutlineInputBorder(),
              suffixText: 'kg',
            ),
            onChanged: (val) => _weight = double.tryParse(val) ?? _weight,
          ),
          const SizedBox(height: 16),

          CheckboxListTile(
            title: const Text('トレーニングした？ 🏋️'),
            value: _isTrained,
            activeColor: const Color(0xFF6A11CB),
            onChanged: (val) => setState(() => _isTrained = val!),
          ),
        ],
      ),
      actions: [
        // 削除ボタン (データがある場合のみ)
        if (hasExistingData)
          TextButton(
            onPressed: () {
              ref
                  .read(planNotifierProvider.notifier)
                  .deleteDailyLog(_selectedDate);
              Navigator.pop(context);
            },
            child: const Text('この記録を削除', style: TextStyle(color: Colors.red)),
          ),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
        ElevatedButton(
          onPressed: () {
            final log = DailyLog(
              date: _selectedDate,
              weight: _weight,
              isTrained: _isTrained,
            );
            ref.read(planNotifierProvider.notifier).addDailyLog(log);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A11CB),
            foregroundColor: Colors.white,
          ),
          child: const Text('保存'),
        ),
      ],
    );
  }
}
