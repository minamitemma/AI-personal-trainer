import 'dart:convert';

import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/infrastructure/api_client/api_constants.dart';
import 'package:ai_personal_trainer/infrastructure/response/plan_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Future<PlanResponse> generatePlan({required UserInput input}) async {
    final path = 'v1beta/models/${ApiConstants.modelName}:generateContent';
    final inputJsonMap = input.toJson();

    String advicePrompt = '';
    if (input.additionalRequest.isNotEmpty) {
      advicePrompt =
          '\n\n[IMPORTANT USER REQUEST]\nThe user has a specific request: "${input.additionalRequest}".\nPlease adjust the training menu and meal plan to strictly follow this request.';
    }

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
      "focus": "Chest and Triceps",
      "exercises": [
        {
          "name": "Bench Press",
          "sets": 3,
          "repsOrDuration": "10 reps",
          "rest": "60s"
        }
      ]
    }
  ],
  "sample_meals": [
    {
      "type": "Breakfast",
      "time": "07:00",
      "description": "Oatmeal with protein powder",
      "mealNutrients": {
        "calories": 400,
        "protein_g": 30,
        "fat_g": 10,
        "carbs_g": 50
      }
    }
  ]
}
''';

    final requestData = {
      'contents': [
        {
          'role': 'user',
          'parts': [
            {
              'text':
                  'You are a professional fitness and nutrition planner. '
                  'Your task is to generate a personalized plan based on the user data provided below.\n\n'
                  'CRITICAL INSTRUCTION:\n'
                  'Your output must be a SINGLE valid JSON object. '
                  'You must STRICTLY follow the JSON structure and Key Names shown in the example below. '
                  'Do NOT use markdown formatting (like ```json). Do NOT include any explanatory text.\n\n'
                  'Expected JSON Structure:\n$jsonSchemaExample\n\n'
                  'User Data:\n$inputJsonMap'
                  '$advicePrompt',
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
                .replaceAll(RegExp(r'```$'), '')
                .trim();

        print('🔍 CLEANED JSON STRING:\n$rawContent');

        try {
          final Map<String, dynamic> decodedMap =
              json.decode(rawContent) as Map<String, dynamic>;

          return PlanResponse.fromJson(decodedMap);
        } catch (e) {
          print('🚨 JSON PARSE/MAPPING ERROR: $e');
          throw Exception(
            'Failed to parse JSON to PlanResponse. Ensure keys match. Error: $e',
          );
        }
      } else {
        throw Exception(
          'API returned status code: ${response.statusCode}. Data: ${response.data}',
        );
      }
    } on DioException catch (e) {
      print('🚨 DioException Status: ${e.response?.statusCode}');
      print('🚨 DioException Message: ${e.message}');
      print('🚨 DioException Response Data: ${e.response?.data}');
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      print('🚨 UNHANDLED EXCEPTION: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }
}

final planApiClientProvider = Provider<PlanApiClient>((ref) {
  return PlanApiClient();
});
