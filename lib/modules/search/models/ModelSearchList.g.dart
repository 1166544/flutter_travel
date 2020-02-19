// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchList _$ModelSearchListFromJson(Map<String, dynamic> json) {
  return ModelSearchList(
    data: json['data'] == null
        ? null
        : ModelSearchContainer.fromJson(json['data'] as Map<String, dynamic>),
    ok: json['ok'] as int,
  );
}

Map<String, dynamic> _$ModelSearchListToJson(ModelSearchList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'ok': instance.ok,
    };
