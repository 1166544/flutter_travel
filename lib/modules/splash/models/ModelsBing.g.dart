// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelsBing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelsBing _$ModelsBingFromJson(Map<String, dynamic> json) {
  return ModelsBing(
    images: (json['images'] as List)
        .map((e) => ModelsBingItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ModelsBingToJson(ModelsBing instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
