// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchButtons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchButtons _$ModelSearchButtonsFromJson(Map<String, dynamic> json) {
  return ModelSearchButtons(
    type: json['type'] as String,
    name: json['name'] as String,
    pic: json['pic'] as String,
    params: json['params'] == null
        ? null
        : ModelSearchParams.fromJson(json['params'] as Map<String, dynamic>),
    actionlog: json['actionlog'] == null
        ? null
        : ModelSearchActionLog.fromJson(
            json['actionlog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchButtonsToJson(ModelSearchButtons instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'pic': instance.pic,
      'params': instance.params,
      'actionlog': instance.actionlog,
    };
