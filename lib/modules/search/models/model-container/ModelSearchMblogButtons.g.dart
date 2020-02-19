// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchMblogButtons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchMblogButtons _$ModelSearchMblogButtonsFromJson(
    Map<String, dynamic> json) {
  return ModelSearchMblogButtons(
    type: json['type'] as String,
    name: json['name'] as String,
    pic: json['pic'] as String,
    actionlog: json['actionlog'] == null
        ? null
        : ModelSearchActionLog.fromJson(
            json['actionlog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchMblogButtonsToJson(
        ModelSearchMblogButtons instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'pic': instance.pic,
      'actionlog': instance.actionlog,
    };
