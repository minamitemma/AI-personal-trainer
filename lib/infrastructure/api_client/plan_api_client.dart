// ファイルパス: lib/infrastructure/api_client/plan_api_client.dart

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

// ドメイン層
import 'package:ai_personal_trainer/domain/constant/exercise_master.dart'; // 🚨 変更: マスターデータ
import 'package:ai_personal_trainer/domain/logic/nutrition_calculator.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/infrastructure/api_client/api_constants.dart';
// インフラ層
import 'package:ai_personal_trainer/infrastructure/response/plan_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --------------------------------------------------
// Riverpod Provider Definition
// --------------------------------------------------

final planApiClientProvider = Provider<PlanApiClient>((ref) {
  return PlanApiClient();
});

// --------------------------------------------------
// API Client Class
// --------------------------------------------------

class PlanApiClient {
  PlanApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConstants.geminiBaseUrl,
              headers: {'Content-Type': 'application/json'},
            ),
          );
  final Dio _dio;

  // 🚨 1. 追加: 利用可能な種目リストをフィルタリングするヘルパー
  List<MasterExerciseData> _getAvailableExercises(UserInput input) {
    final bool isGymAccess = input.gymDays > 0;
    final bool isHomeAccess = input.homeDays > 0;

    // ジムと自宅のどちらも0日の場合、すべての自重種目を候補に残す
    final bool isNoEquipment = !isGymAccess && !isHomeAccess;

    return ExerciseMaster.list.where((ex) {
      // どちらも未設定なら、自宅OKなものを候補にする
      if (isNoEquipment) {
        return ex.equipment == EquipmentTag.homeOnly ||
            ex.equipment == EquipmentTag.both;
      }

      // ジム専用種目なのにジムの日がない -> 除外
      if (ex.equipment == EquipmentTag.gymOnly && !isGymAccess) {
        return false;
      }
      // 自宅専用種目なのに自宅の日がない -> 除外 (※一般的にはジムでも自重はできるので残しても良いが、厳密にするなら除外)
      if (ex.equipment == EquipmentTag.homeOnly && !isHomeAccess) {
        return false;
      }
      return true;
    }).toList();
  }

  /// Gemini generateContent APIを呼び出し、プランを生成する
  Future<PlanResponse> generatePlan({required UserInput input}) async {
    final path = 'v1beta/models/${ApiConstants.modelName}:generateContent';

    // 1. ユーザー入力をJSONマップに変換
    final inputJsonMap = input.toJson();

    // 2. 目標栄養素の計算
    final targetMacros = NutritionCalculator.calculateTarget(input);

    // 🚨 3. 修正: フィルタリングされた種目リストを生成し、文字列化 🚨
    final availableExercises = _getAvailableExercises(input);

    // AIに渡すリスト文字列 ("- ID: "bench_press", Name: "...", Equipment: "Gym Only"")
    final exerciseListString = availableExercises
        .map(
          (e) =>
              '- ID: "${e.id}", Name: "${e.name}", Equipment: "${e.equipment.label}"',
        )
        .join('\n');

    // --- プロンプト構成要素の作成 ---

    // A. JSONスキーマ見本 (キー名を厳守させるため)
    const jsonSchemaExample = '''
{
  "plan_id": "unique_id_123",
  "goal_summary": "目標の要約テキスト",
  "calorieTarget": 2200,
  "macronutrients": {
    "proteinGrams": 150,
    "fatGrams": 70,
    "carbohydrateGrams": 250
  },
  "weekly_workouts": [
    {
      "day": "Day 1",
      "focus": "Chest",
      "exercises": [
        { "name": "bench_press", "sets": 3, "repsOrDuration": "10 reps", "rest": "60s" }
      ]
    }
  ],
  "sample_meals": [
    {
      "type": "Breakfast",
      "time": "07:00",
      "description": "Oatmeal",
      "mealNutrients": { "calories": 400, "protein_g": 30, "fat_g": 10, "carbs_g": 50 }
    }
  ]
}
''';

    // B. 栄養素の強制プロンプト
    final macroPrompt = '''
    [MANDATORY NUTRITION TARGETS]
    Based on logic, the target macronutrients are:
    - Calories: ${targetMacros.calories} kcal
    - Protein: ${targetMacros.proteinGrams} g
    - Fat: ${targetMacros.fatGrams} g
    - Carbs: ${targetMacros.carbsGrams} g
    
    You MUST structure the meal plan to aim for these daily totals.
    ''';

    // C. 筋力データのプロンプト (1RMがある場合)
    String strengthPrompt = '';
    if (input.estimatedBenchPress1rm > 0 ||
        input.estimatedSquat1rm > 0 ||
        input.estimatedDeadlift1rm > 0) {
      strengthPrompt = '''
      [STRENGTH DATA (Estimated 1RM)]
      - Bench Press: ${input.estimatedBenchPress1rm}kg
      - Squat: ${input.estimatedSquat1rm}kg
      - Deadlift: ${input.estimatedDeadlift1rm}kg
      INSTRUCTION: Calculate appropriate working weights (e.g. 75% of 1RM for hypertrophy).
      Example output: "60kg x 10 reps"
      ''';
    }

    // D. アドバイス/実績フィードバック
    String advicePrompt = '';
    if (input.additionalRequest.isNotEmpty) {
      advicePrompt =
          '\n[ADDITIONAL REQUEST / FEEDBACK]\n${input.additionalRequest}';
    }

    // --- リクエストボディの構築 ---
    final requestData = {
      'contents': [
        {
          'role': 'user',
          'parts': [
            {
              'text': """
You are a professional fitness and nutrition planner.
Your task is to generate a personalized plan based on the data below.

[CRITICAL INSTRUCTIONS]
1. Output MUST be a SINGLE valid JSON object.
2. STRICTLY follow this JSON schema structure and Key Names:
$jsonSchemaExample

3. [ALLOWED EXERCISE LIST & EQUIPMENT]
You MUST select exercises ONLY from the list below. This list has been filtered based on the user's available equipment (Gym/Home).
Do NOT suggest exercises that are not in this list or require equipment the user does not have.

$exerciseListString  <-- 🚨 フィルタリング後のリストを注入

For the 'name' field in exercises, prefer using the IDs from this list.

$macroPrompt

$strengthPrompt

$advicePrompt

[USER DATA]
$inputJsonMap
""",
            },
          ],
        },
      ],
      'generationConfig': {
        'temperature': 0.2,
        'responseMimeType': 'application/json',
      },
    };

    try {
      // POSTリクエスト
      final response = await _dio.post(
        path,
        queryParameters: {'key': ApiConstants.geminiApiKey},
        data: requestData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseMap =
            response.data as Map<String, dynamic>;
        String rawContent =
            responseMap['candidates'][0]['content']['parts'][0]['text']
                as String;

        // Markdownクリーニング
        rawContent =
            rawContent
                .replaceAll(RegExp(r'^```json'), '')
                .replaceAll(RegExp(r'^```'), '')
                .replaceAll(RegExp(r'```$'), '')
                .trim();

        print('🔍 CLEANED JSON STRING:\n$rawContent');

        final Map<String, dynamic> decodedMap =
            json.decode(rawContent) as Map<String, dynamic>;
        return PlanResponse.fromJson(decodedMap);
      } else {
        throw Exception('Status ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('🚨 DioException: ${e.message}');
      if (e.response != null) print('Data: ${e.response!.data}');
      throw Exception('Network Error: ${e.message}');
    } catch (e) {
      print('🚨 Parsing Error: $e');
      throw Exception('Failed to parse result: $e');
    }
  }

  /// 📸 画像を解析して栄養素を推定する
  Future<Map<String, dynamic>> analyzeFoodImage(File imageFile) async {
    final path = 'v1beta/models/${ApiConstants.modelName}:generateContent';
    final List<int> imageBytes = await imageFile.readAsBytes();
    final String base64Image = base64Encode(imageBytes);

    final requestData = {
      'contents': [
        {
          'role': 'user',
          'parts': [
            {
              'text':
                  'Analyze this food image. Identify the dish and estimate its nutritional content. \n'
                  'Output ONLY a single JSON object with these keys: \n'
                  "'food_name' (String), 'calories' (int), 'protein_g' (int), 'fat_g' (int), 'carbs_g' (int).\n"
                  'Do not use markdown formatting.',
            },
            {
              'inline_data': {'mime_type': 'image/jpeg', 'data': base64Image},
            },
          ],
        },
      ],
      'generationConfig': {
        'temperature': 0.2,
        'responseMimeType': 'application/json',
      },
    };

    try {
      print('📸 Sending image to Gemini...');
      final response = await _dio.post(
        path,
        queryParameters: {'key': ApiConstants.geminiApiKey},
        data: requestData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseMap =
            response.data as Map<String, dynamic>;
        String rawContent =
            responseMap['candidates'][0]['content']['parts'][0]['text']
                as String;

        rawContent =
            rawContent
                .replaceAll(RegExp(r'^```json'), '')
                .replaceAll(RegExp(r'^```'), '')
                .trim();

        print('📸 RAW ANALYSIS RESULT:\n$rawContent');
        return json.decode(rawContent) as Map<String, dynamic>;
      } else {
        throw Exception('Status ${response.statusCode}');
      }
    } catch (e) {
      print('🚨 Vision API Error: $e');
      throw Exception('Image analysis failed: $e');
    }
  }
}
