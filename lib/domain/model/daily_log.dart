// lib/domain/model/daily_log.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_log.freezed.dart';
part 'daily_log.g.dart';

@freezed
abstract class DailyLog with _$DailyLog {
  const factory DailyLog({
    required DateTime date, // 記録日
    required double weight, // 体重
    @Default(false) bool isTrained, // トレーニングしたかどうか
  }) = _DailyLog;

  factory DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);
}
