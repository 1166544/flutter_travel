// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchCards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchCards _$ModelSearchCardsFromJson(Map<String, dynamic> json) {
  return ModelSearchCards(
    cardType: json['card_type'] as int,
    itemid: json['itemid'] as String,
    scheme: json['scheme'] as String,
    weiboNeed: json['weibo_need'] as String,
    mblog: json['mblog'] == null
        ? null
        : ModelSearchMblog.fromJson(json['mblog'] as Map<String, dynamic>),
    showType: json['show_type'] as int,
    mblogBbuttons: (json['mblog_buttons'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchMblogBbuttons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hotRequestId: json['hot_request_id'] as String,
  );
}

Map<String, dynamic> _$ModelSearchCardsToJson(ModelSearchCards instance) =>
    <String, dynamic>{
      'card_type': instance.cardType,
      'itemid': instance.itemid,
      'scheme': instance.scheme,
      'weibo_need': instance.weiboNeed,
      'mblog': instance.mblog,
      'show_type': instance.showType,
      'mblog_buttons': instance.mblogBbuttons,
      'hot_request_id': instance.hotRequestId,
    };
