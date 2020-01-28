// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6AirNowCity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6AirNowCity _$ModelS6AirNowCityFromJson(Map<String, dynamic> json) {
  return ModelS6AirNowCity(
    aqi: json['aqi'] as String,
    qlty: json['qlty'] as String,
    main: json['main'] as String,
    pm10: json['pm10'] as String,
    pm25: json['pm25'] as String,
    no2: json['no2'] as String,
    so2: json['so2'] as String,
    co: json['co'] as String,
    o3: json['o3'] as String,
    pubTime: json['pub_time'] as String,
  );
}

Map<String, dynamic> _$ModelS6AirNowCityToJson(ModelS6AirNowCity instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'qlty': instance.qlty,
      'main': instance.main,
      'pm25': instance.pm25,
      'pm10': instance.pm10,
      'no2': instance.no2,
      'so2': instance.so2,
      'co': instance.co,
      'o3': instance.o3,
      'pub_time': instance.pubTime,
    };
