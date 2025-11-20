// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyLog _$DailyLogFromJson(Map<String, dynamic> json) => _DailyLog(
  date: DateTime.parse(json['date'] as String),
  weight: (json['weight'] as num).toDouble(),
  isTrained: json['isTrained'] as bool? ?? false,
);

Map<String, dynamic> _$DailyLogToJson(_DailyLog instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'weight': instance.weight,
  'isTrained': instance.isTrained,
};
