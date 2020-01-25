// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelExt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelExt _$ModelExtFromJson(Map<String, dynamic> json) {
  return ModelExt(
    ac: json['ac'] as String,
    auth: json['auth'] as int,
    cms: json['cms'] as int,
    contentType: json['content_type'] as int,
    interact: json['interact'] as int,
    qid: json['qid'] as String,
    readcnt: json['readcnt'] as int,
    ts: json['ts'] as int,
  );
}

Map<String, dynamic> _$ModelExtToJson(ModelExt instance) => <String, dynamic>{
      'ac': instance.ac,
      'auth': instance.auth,
      'cms': instance.cms,
      'content_type': instance.contentType,
      'interact': instance.interact,
      'qid': instance.qid,
      'readcnt': instance.readcnt,
      'ts': instance.ts,
    };
