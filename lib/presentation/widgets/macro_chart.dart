import 'package:ai_personal_trainer/domain/model/nutrition_plan.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MacroNutrientChart extends StatelessWidget {
  const MacroNutrientChart({super.key, required this.nutrients});
  final NutrientSummary nutrients;

  @override
  Widget build(BuildContext context) {
    // 合計グラム数を計算（割合を出すため）
    final total =
        nutrients.proteinGrams + nutrients.fatGrams + nutrients.carbsGrams;
    if (total == 0) return const SizedBox.shrink();

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              sections: [
                _buildSection(
                  'P',
                  nutrients.proteinGrams,
                  total,
                  Colors.redAccent,
                ),
                _buildSection(
                  'F',
                  nutrients.fatGrams,
                  total,
                  Colors.orangeAccent,
                ),
                _buildSection(
                  'C',
                  nutrients.carbsGrams,
                  total,
                  Colors.greenAccent,
                ),
              ],
            ),
          ),
          // 真ん中にカロリーを表示
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${nutrients.calories}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'kcal',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PieChartSectionData _buildSection(
    String title,
    int value,
    int total,
    Color color,
  ) {
    final percentage = (value / total * 100).toStringAsFixed(1);
    return PieChartSectionData(
      color: color,
      value: value.toDouble(),
      title: '$title\n$percentage%',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
