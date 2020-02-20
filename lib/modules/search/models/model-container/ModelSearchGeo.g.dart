// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchGeo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchGeo _$ModelSearchGeoFromJson(Map<String, dynamic> json) {
  return ModelSearchGeo(
    json['width'],
    json['height'],
    json['croped'] as bool,
  );
}

Map<String, dynamic> _$ModelSearchGeoToJson(ModelSearchGeo instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'croped': instance.croped,
    };
