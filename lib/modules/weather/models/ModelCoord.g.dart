// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelCoord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelCoord _$ModelCoordFromJson(Map<String, dynamic> json) {
  return ModelCoord(
    lon: (json['lon'] as num)?.toDouble(),
    lat: (json['lat'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ModelCoordToJson(ModelCoord instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
