// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchActionLog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchActionLog _$ModelSearchActionLogFromJson(Map<String, dynamic> json) {
  return ModelSearchActionLog(
    json['source'] as String,
    json['act_code'],
    json['act_type'],
    json['fid'] as String,
    json['lfid'] as String,
    json['oid'] as String,
    json['uicode'] as String,
    json['ext'] as String,
  );
}

Map<String, dynamic> _$ModelSearchActionLogToJson(
        ModelSearchActionLog instance) =>
    <String, dynamic>{
      'source': instance.source,
      'act_code': instance.actCode,
      'act_type': instance.actType,
      'fid': instance.fid,
      'lfid': instance.lfid,
      'oid': instance.oid,
      'uicode': instance.uicode,
      'ext': instance.ext,
    };
