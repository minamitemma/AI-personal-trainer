import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get geminiBaseUrl =>
      dotenv.env['GEMINI_BASE_URL'] ??
      'https://generativelanguage.googleapis.com/';

  static String get geminiApiKey {
    final key = dotenv.env['GEMINI_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('GEMINI_API_KEY not found in .env file');
    }
    return key;
  }

  static String get modelName =>
      dotenv.env['GEMINI_MODEL_NAME'] ?? 'gemini-2.5-flash';
}
