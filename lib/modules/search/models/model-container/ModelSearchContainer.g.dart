// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchContainer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchContainer _$ModelSearchContainerFromJson(Map<String, dynamic> json) {
  return ModelSearchContainer(
    cardlistInfo: json['cardlistInfo'] == null
        ? null
        : ModelSearchCardlistInfo.fromJson(
            json['cardlistInfo'] as Map<String, dynamic>),
    banners: json['banners'],
    scheme: json['scheme'] as String,
    showAppTips: json['showAppTips'] as int,
    openApp: json['openApp'] as int,
  )..cards = (json['cards'] as List)
      ?.map((e) => e == null
          ? null
          : ModelSearchCards.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$ModelSearchContainerToJson(
        ModelSearchContainer instance) =>
    <String, dynamic>{
      'cardlistInfo': instance.cardlistInfo,
      'cards': instance.cards,
      'banners': instance.banners,
      'scheme': instance.scheme,
      'showAppTips': instance.showAppTips,
      'openApp': instance.openApp,
    };
