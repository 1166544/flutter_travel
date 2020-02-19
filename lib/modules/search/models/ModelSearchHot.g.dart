// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchHot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchHot _$ModelSearchHotFromJson(Map<String, dynamic> json) {
  return ModelSearchHot(
    ok: json['ok'] as int,
    hotWord: json['hotWord'] as String,
    scheme: json['scheme'] as String,
  );
}

Map<String, dynamic> _$ModelSearchHotToJson(ModelSearchHot instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'hotWord': instance.hotWord,
      'scheme': instance.scheme,
    };
