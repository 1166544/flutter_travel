// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchMblogBbuttons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchMblogBbuttons _$ModelSearchMblogBbuttonsFromJson(
    Map<String, dynamic> json) {
  return ModelSearchMblogBbuttons(
    json['type'] as String,
    json['name'] as String,
    json['pic'] as String,
    json['actionlog'] == null
        ? null
        : ModelSearchActionLog.fromJson(
            json['actionlog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchMblogBbuttonsToJson(
        ModelSearchMblogBbuttons instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'pic': instance.pic,
      'actionlog': instance.actionlog,
    };
