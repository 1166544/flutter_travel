// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6HeWeather6.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6HeWeather6 _$ModelS6HeWeather6FromJson(Map<String, dynamic> json) {
  return ModelS6HeWeather6(
    basic: json['basic'] == null
        ? null
        : ModelS6Basic.fromJson(json['basic'] as Map<String, dynamic>),
    update: json['update'] == null
        ? null
        : ModelS6Update.fromJson(json['update'] as Map<String, dynamic>),
    status: json['status'] as String,
    now: json['now'] == null
        ? null
        : ModelS6Now.fromJson(json['now'] as Map<String, dynamic>),
    dailyForecast: (json['daily_forecast'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6DailyForecast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hourly: (json['hourly'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6Hourly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lifestyle: (json['lifestyle'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6Lifestyle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModelS6HeWeather6ToJson(ModelS6HeWeather6 instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'now': instance.now,
      'daily_forecast': instance.dailyForecast,
      'hourly': instance.hourly,
      'lifestyle': instance.lifestyle,
    };
