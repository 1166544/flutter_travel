// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchPlayCompletionActions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchPlayCompletionActions _$ModelSearchPlayCompletionActionsFromJson(
    Map<String, dynamic> json) {
  return ModelSearchPlayCompletionActions(
    json['type'] as String,
    json['icon'] as String,
    json['text'] as String,
    json['link'] as String,
    json['btn_code'] as int,
    json['show_position'] as int,
    json['actionlog'] == null
        ? null
        : ModelSearchActionLog.fromJson(
            json['actionlog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchPlayCompletionActionsToJson(
        ModelSearchPlayCompletionActions instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.icon,
      'text': instance.text,
      'link': instance.link,
      'btn_code': instance.btnCode,
      'show_position': instance.showPosition,
      'actionlog': instance.actionlog,
    };
