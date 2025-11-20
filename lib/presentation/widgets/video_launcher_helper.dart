// ファイルパス: lib/presentation/widgets/video_launcher_helper.dart

import 'package:ai_personal_trainer/domain/constant/exercise_master.dart'; // 🚨 追加
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoLauncherHelper {
  /// YouTubeで種目名を検索して開く
  static Future<void> launchVideoSearch(
    BuildContext context,
    String exerciseName,
  ) async {
    // 🚨 修正: マスターデータを検索 🚨
    final masterData = ExerciseMaster.findByName(exerciseName);

    String searchQuery;
    if (masterData != null) {
      // マッチしたら、最適化されたクエリを使う (例: "腕立て" -> "腕立て伏せ 正しいやり方")
      print('✅ Master Data Matched: ${masterData.name}');
      searchQuery = masterData.videoQuery;
    } else {
      // マッチしなければ、AIの出力をそのまま使いつつ、キーワードを足す
      print('⚠️ No Master Data for: $exerciseName');
      searchQuery = '$exerciseName フォーム 解説';
    }

    final query = Uri.encodeComponent(searchQuery);

    // iOSシミュレータ等は youtube:// スキームでアプリを開ける場合もあるが、
    // 安全のため https でブラウザ/アプリ両対応にする
    final url = Uri.parse(
      'https://www.youtube.com/results?search_query=$query',
    );

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('動画を開けませんでした: $e')));
      }
    }
  }
}
