// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchTabList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchTabList _$ModelSearchTabListFromJson(Map<String, dynamic> json) {
  return ModelSearchTabList(
    ok: json['ok'] as int,
    data: json['data'] == null
        ? null
        : ModelSearchTabData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchTabListToJson(ModelSearchTabList instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data,
    };
