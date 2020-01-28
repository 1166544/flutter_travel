// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSys _$ModelSysFromJson(Map<String, dynamic> json) {
  return ModelSys(
    type: json['type'] as int,
    id: json['id'] as int,
    country: json['country'] as String,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$ModelSysToJson(ModelSys instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
