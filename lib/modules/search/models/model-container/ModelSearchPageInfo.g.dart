// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchPageInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchPageInfo _$ModelSearchPageInfoFromJson(Map<String, dynamic> json) {
  return ModelSearchPageInfo(
    json['page_pic'] == null
        ? null
        : ModelSearchPagePic.fromJson(json['page_pic'] as Map<String, dynamic>),
    json['page_url'] as String,
    json['page_title'] as String,
    json['content1'] as String,
    json['content2'] as String,
    json['type'] as String,
    json['media_info'] == null
        ? null
        : ModelSearchMediaInfo.fromJson(
            json['media_info'] as Map<String, dynamic>),
    json['play_count'] as int,
    json['object_id'] as String,
  );
}

Map<String, dynamic> _$ModelSearchPageInfoToJson(
        ModelSearchPageInfo instance) =>
    <String, dynamic>{
      'page_pic': instance.pagePic,
      'page_url': instance.pageUrl,
      'page_title': instance.pageTitle,
      'content1': instance.content1,
      'content2': instance.content2,
      'type': instance.type,
      'media_info': instance.mediaInfo,
      'play_count': instance.playCount,
      'object_id': instance.objectId,
    };
