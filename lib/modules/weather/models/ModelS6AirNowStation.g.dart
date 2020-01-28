// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6AirNowStation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6AirNowStation _$ModelS6AirNowStationFromJson(Map<String, dynamic> json) {
  return ModelS6AirNowStation(
    airSta: json['air_sta'] as String,
    aqi: json['aqi'] as String,
    asid: json['asid'] as String,
    co: json['co'] as String,
    lat: json['lat'] as String,
    lon: json['lon'] as String,
    main: json['main'] as String,
    no2: json['no2'] as String,
    o3: json['o3'] as String,
    pm25: json['pm25'] as String,
    pm10: json['pm10'] as String,
    pubTime: json['pub_time'] as String,
    qlty: json['qlty'] as String,
    so2: json['so2'] as String,
  );
}

Map<String, dynamic> _$ModelS6AirNowStationToJson(
        ModelS6AirNowStation instance) =>
    <String, dynamic>{
      'air_sta': instance.airSta,
      'aqi': instance.aqi,
      'asid': instance.asid,
      'co': instance.co,
      'lat': instance.lat,
      'lon': instance.lon,
      'main': instance.main,
      'no2': instance.no2,
      'o3': instance.o3,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'pub_time': instance.pubTime,
      'qlty': instance.qlty,
      'so2': instance.so2,
    };
