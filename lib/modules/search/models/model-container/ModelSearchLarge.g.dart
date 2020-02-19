// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchLarge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchLarge _$ModelSearchLargeFromJson(Map<String, dynamic> json) {
  return ModelSearchLarge(
    size: json['size'] as String,
    url: json['url'] as String,
    geo: json['geo'] == null
        ? null
        : ModelSearchGeo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchLargeToJson(ModelSearchLarge instance) =>
    <String, dynamic>{
      'size': instance.size,
      'url': instance.url,
      'geo': instance.geo,
    };
