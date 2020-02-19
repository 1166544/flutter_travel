// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchBedge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchBedge _$ModelSearchBedgeFromJson(Map<String, dynamic> json) {
  return ModelSearchBedge(
    unreadPool: json['unread_pool'] as int,
    userNameCertificate: json['user_name_certificate'] as int,
    nationalDay2018: json['national_day_2018'] as int,
    weiboDisplayFans: json['weibo_display_fans'] as int,
    relationDisplay: json['relation_display'] as int,
    wusi2019: json['wusi_2019'] as int,
    hongrenjie2019: json['hongrenjie_2019'] as int,
    hongbao2020: json['hongbao_2020'] as int,
  );
}

Map<String, dynamic> _$ModelSearchBedgeToJson(ModelSearchBedge instance) =>
    <String, dynamic>{
      'unread_pool': instance.unreadPool,
      'user_name_certificate': instance.userNameCertificate,
      'national_day_2018': instance.nationalDay2018,
      'weibo_display_fans': instance.weiboDisplayFans,
      'relation_display': instance.relationDisplay,
      'wusi_2019': instance.wusi2019,
      'hongrenjie_2019': instance.hongrenjie2019,
      'hongbao_2020': instance.hongbao2020,
    };
