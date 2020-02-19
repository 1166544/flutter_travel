// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchCardlistInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchCardlistInfo _$ModelSearchCardlistInfoFromJson(
    Map<String, dynamic> json) {
  return ModelSearchCardlistInfo(
    vp: json['v_p'] as String,
    statisticsFrom: json['statistics_from'] as String,
    containerid: json['containerid'] as String,
    titleTop: json['title_top'] as String,
    showStyle: json['show_style'] as int,
    total: json['total'] as int,
    canShared: json['can_shared'] as int,
    sinceId: json['since_id'] as int,
    cardlistTitle: json['cardlist_title'] as String,
    desc: json['desc'] as String,
    cardlistHeadCards: json['cardlist_head_cards'] == null
        ? null
        : ModelSearchCardListHeadCards.fromJson(
            json['cardlist_head_cards'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchCardlistInfoToJson(
        ModelSearchCardlistInfo instance) =>
    <String, dynamic>{
      'v_p': instance.vp,
      'statistics_from': instance.statisticsFrom,
      'containerid': instance.containerid,
      'title_top': instance.titleTop,
      'show_style': instance.showStyle,
      'total': instance.total,
      'can_shared': instance.canShared,
      'since_id': instance.sinceId,
      'cardlist_title': instance.cardlistTitle,
      'desc': instance.desc,
      'cardlist_head_cards': instance.cardlistHeadCards,
    };
