import 'dart:io';

import 'package:ai_personal_trainer/infrastructure/api_client/plan_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 📸 食事解析ダイアログを表示する共通関数
Future<void> showFoodAnalysisDialog(BuildContext context, WidgetRef ref) async {
  final picker = ImagePicker();
  // ギャラリーから選択 (実機なら .camera も可)
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;

  if (!context.mounted) return;

  // ローディング表示
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (ctx) => const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('AIが画像を解析中...'),
                ],
              ),
            ),
          ),
        ),
  );

  try {
    final apiClient = ref.read(planApiClientProvider);
    final result = await apiClient.analyzeFoodImage(File(image.path));

    if (!context.mounted) return;
    Navigator.pop(context); // ローディング消す

    // 結果表示ダイアログ
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Row(
              children: [
                const Icon(Icons.restaurant, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    (result['food_name'] as String?) ?? '不明な料理',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(image.path),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${result['calories']} kcal',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _macroColumn('P', '${result['protein_g']}g', Colors.red),
                    _macroColumn('F', '${result['fat_g']}g', Colors.orange),
                    _macroColumn('C', '${result['carbs_g']}g', Colors.green),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('閉じる'),
              ),
            ],
          ),
    );
  } catch (e) {
    if (context.mounted) {
      Navigator.pop(context); // ローディング消す
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('解析失敗: $e')));
    }
  }
}

// ヘルパーウィジェット
Widget _macroColumn(String label, String val, Color color) {
  return Column(
    children: [
      Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      Text(val, style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}
