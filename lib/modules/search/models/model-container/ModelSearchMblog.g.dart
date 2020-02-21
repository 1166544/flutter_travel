// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchMblog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchMblog _$ModelSearchMblogFromJson(Map<String, dynamic> json) {
  return ModelSearchMblog(
    visible: json['visible'] == null
        ? null
        : ModelSearchVisible.fromJson(json['visible'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String,
    id: json['id'] as String,
    idstr: json['idstr'] as String,
    mid: json['mid'] as String,
    canEdit: json['can_edit'] as bool,
    showAdditionalIndication: json['show_additional_indication'] as int,
    text: json['text'] as String,
    textLength: json['textLength'] as int,
    source: json['source'] as String,
    favorited: json['favorited'] as bool,
    picTypes: json['pic_types'] as String,
    thumbnailPic: json['thumbnail_pic'] as String,
    bmiddlePic: json['bmiddle_pic'] as String,
    originalPic: json['original_pic'] as String,
    isPaid: json['is_paid'] as bool,
    mblogVipType: json['mblog_vip_type'] as int,
    user: json['user'] == null
        ? null
        : ModelSearchUser.fromJson(json['user'] as Map<String, dynamic>),
    repostsCount: json['reposts_count'] as int,
    commentsCount: json['comments_count'] as int,
    attitudesCount: json['attitudes_count'] as int,
    pendingApprovalCount: json['pending_approval_count'] as int,
    isLongText: json['isLongText'] as bool,
    rewardExhibitionType: json['reward_exhibition_type'] as int,
    rewardScheme: json['reward_scheme'] as String,
    hideFlag: json['hide_flag'] as int,
    mlevel: json['mlevel'] as int,
    mblogtype: json['mblogtype'] as int,
    rid: json['rid'] as String,
    moreInfoType: json['more_info_type'] as int,
    cardid: json['cardid'] as String,
    externSafe: json['extern_safe'] as int,
    numberDisplayStrategy: json['number_display_strategy'] == null
        ? null
        : ModelSearchNumberDisplayStrategy.fromJson(
            json['number_display_strategy'] as Map<String, dynamic>),
    contentAuth: json['content_auth'] as int,
    picNum: json['pic_num'] as int,
    weiboPosition: json['weibo_position'] as int,
    showAttitudeBar: json['show_attitude_bar'] as int,
    buttons: (json['buttons'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchButtons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fromCateid: json['from_cateid'] as String,
    recommendSource: json['recommend_source'] as int,
    mblogButtons: (json['mblog_buttons'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchMblogButtons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bid: json['bid'] as String,
    pics: (json['pics'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchPics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..pageInfo = json['page_info'] == null
      ? null
      : ModelSearchPageInfo.fromJson(json['page_info'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ModelSearchMblogToJson(ModelSearchMblog instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'created_at': instance.createdAt,
      'id': instance.id,
      'idstr': instance.idstr,
      'mid': instance.mid,
      'can_edit': instance.canEdit,
      'show_additional_indication': instance.showAdditionalIndication,
      'text': instance.text,
      'textLength': instance.textLength,
      'source': instance.source,
      'favorited': instance.favorited,
      'pic_types': instance.picTypes,
      'thumbnail_pic': instance.thumbnailPic,
      'bmiddle_pic': instance.bmiddlePic,
      'original_pic': instance.originalPic,
      'is_paid': instance.isPaid,
      'mblog_vip_type': instance.mblogVipType,
      'user': instance.user,
      'reposts_count': instance.repostsCount,
      'comments_count': instance.commentsCount,
      'attitudes_count': instance.attitudesCount,
      'pending_approval_count': instance.pendingApprovalCount,
      'isLongText': instance.isLongText,
      'reward_exhibition_type': instance.rewardExhibitionType,
      'reward_scheme': instance.rewardScheme,
      'hide_flag': instance.hideFlag,
      'mlevel': instance.mlevel,
      'mblogtype': instance.mblogtype,
      'rid': instance.rid,
      'more_info_type': instance.moreInfoType,
      'cardid': instance.cardid,
      'extern_safe': instance.externSafe,
      'number_display_strategy': instance.numberDisplayStrategy,
      'content_auth': instance.contentAuth,
      'pic_num': instance.picNum,
      'weibo_position': instance.weiboPosition,
      'show_attitude_bar': instance.showAttitudeBar,
      'buttons': instance.buttons,
      'from_cateid': instance.fromCateid,
      'recommend_source': instance.recommendSource,
      'bid': instance.bid,
      'mblog_buttons': instance.mblogButtons,
      'pics': instance.pics,
      'page_info': instance.pageInfo,
    };
