// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchMediaInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchMediaInfo _$ModelSearchMediaInfoFromJson(Map<String, dynamic> json) {
  return ModelSearchMediaInfo(
    json['video_orientation'] as String,
    json['name'] as String,
    json['stream_url'] as String,
    json['stream_url_hd'] as String,
    json['h5_url'] as String,
    json['mp4_sd_url'] as String,
    json['mp4_hd_url'] as String,
    json['h265_mp4_hd'] as String,
    json['h265_mp4_ld'] as String,
    json['inch_4_mp4_hd'] as String,
    json['inch_5_mp4_hd'] as String,
    json['inch_5_5_mp4_hd'] as String,
    json['mp4_720p_mp4'] as String,
    json['hevc_mp4_720p'] as String,
    json['prefetch_type'] as int,
    json['prefetch_size'] as int,
    json['act_status'] as int,
    json['protocol'] as String,
    json['media_id'] as String,
    json['origin_total_bitrate'] as int,
    json['duration'] as int,
    json['next_title'] as String,
    (json['play_completion_actions'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchPlayCompletionActions.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    json['video_publish_time'] as int,
    json['play_loop_type'] as int,
    json['author_mid'] as String,
    json['author_name'] as String,
    json['extra_info'] == null
        ? null
        : ModelSearchExtraInfo.fromJson(
            json['extra_info'] as Map<String, dynamic>),
    json['has_recommend_video'] as int,
    json['video_download_strategy'] == null
        ? null
        : ModelSearchVideoDownloadStrategy.fromJson(
            json['video_download_strategy'] as Map<String, dynamic>),
    json['online_users'] as String,
    json['online_users_number'] as int,
    json['ttl'] as int,
    json['storage_type'] as String,
    json['is_keep_current_mblog'] as int,
  );
}

Map<String, dynamic> _$ModelSearchMediaInfoToJson(
        ModelSearchMediaInfo instance) =>
    <String, dynamic>{
      'video_orientation': instance.videoOrientation,
      'name': instance.name,
      'stream_url': instance.streamUrl,
      'stream_url_hd': instance.streamUrlHd,
      'h5_url': instance.h5Url,
      'mp4_sd_url': instance.mp4SdUrl,
      'mp4_hd_url': instance.mp4HdUrl,
      'h265_mp4_hd': instance.h265Mp4Hd,
      'h265_mp4_ld': instance.h265Mp4Ld,
      'inch_4_mp4_hd': instance.inch4Mp4Hd,
      'inch_5_mp4_hd': instance.inch5Mp4Hd,
      'inch_5_5_mp4_hd': instance.inch55Mp4Hd,
      'mp4_720p_mp4': instance.mp4720pMp4,
      'hevc_mp4_720p': instance.hevcMp4720p,
      'prefetch_type': instance.prefetchType,
      'prefetch_size': instance.prefetchSize,
      'act_status': instance.actStatus,
      'protocol': instance.protocol,
      'media_id': instance.mediaId,
      'origin_total_bitrate': instance.originTotalBitrate,
      'duration': instance.duration,
      'next_title': instance.nextTitle,
      'play_completion_actions': instance.playCompletionActions,
      'video_publish_time': instance.videoPublishTime,
      'play_loop_type': instance.playLoopType,
      'author_mid': instance.authorMid,
      'author_name': instance.authorName,
      'extra_info': instance.extraInfo,
      'has_recommend_video': instance.hasRecommendVideo,
      'video_download_strategy': instance.videoDownloadStrategy,
      'online_users': instance.onlineUsers,
      'online_users_number': instance.onlineUsersNumber,
      'ttl': instance.ttl,
      'storage_type': instance.storageType,
      'is_keep_current_mblog': instance.isKeepCurrentMblog,
    };
