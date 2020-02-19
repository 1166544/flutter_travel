// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchPics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchPics _$ModelSearchPicsFromJson(Map<String, dynamic> json) {
  return ModelSearchPics(
    pid: json['pid'] as String,
    url: json['url'] as String,
    size: json['size'] as String,
    geo: json['geo'] == null
        ? null
        : ModelSearchGeo.fromJson(json['geo'] as Map<String, dynamic>),
    large: json['large'] == null
        ? null
        : ModelSearchLarge.fromJson(json['large'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchPicsToJson(ModelSearchPics instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'url': instance.url,
      'size': instance.size,
      'geo': instance.geo,
      'large': instance.large,
    };
