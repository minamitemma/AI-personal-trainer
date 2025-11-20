// ファイルパス: lib/presentation/widgets/weight_chart.dart

import 'package:ai_personal_trainer/presentation/screens/records/records_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key, required this.dataPoints});
  final List<RecordPoint> dataPoints;

  @override
  Widget build(BuildContext context) {
    if (dataPoints.isEmpty) {
      return const Center(child: Text('データがありません'));
    }

    // 🚨 修正1: X軸を「インデックス」から「タイムスタンプ(double)」に変更 🚨
    final spots =
        dataPoints.map((point) {
          // X軸: 日付(ミリ秒), Y軸: 体重
          return FlSpot(
            point.date.millisecondsSinceEpoch.toDouble(),
            point.weight,
          );
        }).toList();

    // Y軸の範囲計算（見やすくするため上下に余白を持たせる）
    final weights = dataPoints.map((e) => e.weight).toList();
    final minWeight = weights.reduce((a, b) => a < b ? a : b) - 2;
    final maxWeight = weights.reduce((a, b) => a > b ? a : b) + 2;

    // X軸の範囲（最初の日〜最後の日）
    final minX = spots.first.x;
    final maxX = spots.last.x;

    // 期間が短すぎると表示が崩れるので、最低でも1日分の幅を持たせる
    final xRange = maxX - minX;
    final safeMaxX = xRange < 86400000 ? minX + 86400000 : maxX;

    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            minY: minWeight,
            maxY: maxWeight,
            minX: minX,
            maxX: safeMaxX,

            gridData: const FlGridData(show: true, drawVerticalLine: false),

            titlesData: FlTitlesData(
              // 左側のメモリ（体重）
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 5, // 5kg刻みくらいが丁度いい
                ),
              ),

              // 下側のメモリ（日付）
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  // 🚨 修正2: タイムスタンプを日付に戻して表示 🚨
                  getTitlesWidget: (value, meta) {
                    final date = DateTime.fromMillisecondsSinceEpoch(
                      value.toInt(),
                    );

                    // データが重ならないように間引くロジックは fl_chart がある程度やってくれますが、
                    // フォーマットを短くして見やすくします。
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        DateFormat('M/d').format(date),
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  },
                  // ラベルの間隔調整: 全期間を5分割くらいして表示するイメージ
                  // (ここを調整しないと日付が重なって真っ黒になることがあります)
                  interval: (safeMaxX - minX) / 5,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),

            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey.shade300),
            ),

            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: const Color(0xFF6A11CB),
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0xFF6A11CB).withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
