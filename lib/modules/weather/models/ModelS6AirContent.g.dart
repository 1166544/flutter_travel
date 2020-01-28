// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6AirContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6AirContent _$ModelS6AirContentFromJson(Map<String, dynamic> json) {
  return ModelS6AirContent(
    basic: json['basic'] == null
        ? null
        : ModelS6Basic.fromJson(json['basic'] as Map<String, dynamic>),
    update: json['update'] == null
        ? null
        : ModelS6Update.fromJson(json['update'] as Map<String, dynamic>),
    airNowCity: json['air_now_city'] == null
        ? null
        : ModelS6AirNowCity.fromJson(
            json['air_now_city'] as Map<String, dynamic>),
    airNowStation: (json['air_now_station'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6AirNowStation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..status = json['status'] as String;
}

Map<String, dynamic> _$ModelS6AirContentToJson(ModelS6AirContent instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'air_now_city': instance.airNowCity,
      'air_now_station': instance.airNowStation,
    };
