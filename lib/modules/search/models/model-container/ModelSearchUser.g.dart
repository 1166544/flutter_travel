// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchUser _$ModelSearchUserFromJson(Map<String, dynamic> json) {
  return ModelSearchUser(
    id: json['id'] as int,
    screenName: json['screen_name'] as String,
    profileImageUrl: json['profile_image_url'] as String,
    profileUrl: json['profile_url'] as String,
    statusesCount: json['statuses_count'] as int,
    verified: json['verified'] as bool,
    verifiedType: json['verified_type'] as int,
    closeBlueV: json['close_blue_v'] as bool,
    description: json['description'] as String,
    gender: json['gender'] as String,
    mbtype: json['mbtype'] as int,
    urank: json['urank'] as int,
    mbrank: json['mbrank'] as int,
    followMe: json['follow_me'] as bool,
    following: json['following'] as bool,
    followersCount: json['followers_count'] as int,
    followCount: json['follow_count'] as int,
    coverImagePhone: json['cover_image_phone'] as String,
    avatarHd: json['avatar_hd'] as String,
    like: json['like'] as bool,
    likeMe: json['like_me'] as bool,
    bedge: json['bedge'] == null
        ? null
        : ModelSearchBedge.fromJson(json['bedge'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchUserToJson(ModelSearchUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'screen_name': instance.screenName,
      'profile_image_url': instance.profileImageUrl,
      'profile_url': instance.profileUrl,
      'statuses_count': instance.statusesCount,
      'verified': instance.verified,
      'verified_type': instance.verifiedType,
      'close_blue_v': instance.closeBlueV,
      'description': instance.description,
      'gender': instance.gender,
      'mbtype': instance.mbtype,
      'urank': instance.urank,
      'mbrank': instance.mbrank,
      'follow_me': instance.followMe,
      'following': instance.following,
      'followers_count': instance.followersCount,
      'follow_count': instance.followCount,
      'cover_image_phone': instance.coverImagePhone,
      'avatar_hd': instance.avatarHd,
      'like': instance.like,
      'like_me': instance.likeMe,
      'bedge': instance.bedge,
    };
