// ファイルパス: lib/presentation/widgets/activity_calendar.dart

import 'package:ai_personal_trainer/presentation/screens/records/records_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivityCalendar extends StatelessWidget {
  // 🚨 追加

  const ActivityCalendar({
    super.key,
    required this.dataPoints,
    this.onDaySelected,
  });
  final List<RecordPoint> dataPoints;
  final Function(DateTime, DateTime)? onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),

      // マーカーを表示するロジック
      eventLoader: (day) {
        return dataPoints
            .where((p) => isSameDay(p.date, day) && p.hasActivity)
            .toList();
      },

      // 🚨 タップ操作の有効化
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
      onDaySelected: onDaySelected,

      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        markerDecoration: const BoxDecoration(
          color: Color(0xFF6A11CB),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
