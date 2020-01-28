// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6Basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6Basic _$ModelS6BasicFromJson(Map<String, dynamic> json) {
  return ModelS6Basic(
    cid: json['cid'] as String,
    location: json['location'] as String,
    parentCity: json['parent_city'] as String,
    adminArea: json['admin_area'] as String,
    cnty: json['cnty'] as String,
    lat: json['lat'] as String,
    lon: json['lon'] as String,
    tz: json['tz'] as String,
  );
}

Map<String, dynamic> _$ModelS6BasicToJson(ModelS6Basic instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'location': instance.location,
      'parent_city': instance.parentCity,
      'admin_area': instance.adminArea,
      'cnty': instance.cnty,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz': instance.tz,
    };
