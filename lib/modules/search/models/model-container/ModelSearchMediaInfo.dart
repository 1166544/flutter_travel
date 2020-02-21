  
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchExtraInfo.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchPlayCompletionActions.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchVideoDownloadStrategy.dart';
import 'package:json_annotation/json_annotation.dart'; 

part 'ModelSearchMediaInfo.g.dart';

@JsonSerializable()
class ModelSearchMediaInfo extends Object {

  @JsonKey(name: 'video_orientation')
  String videoOrientation;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'stream_url')
  String streamUrl;

  @JsonKey(name: 'stream_url_hd')
  String streamUrlHd;

  @JsonKey(name: 'h5_url')
  String h5Url;

  @JsonKey(name: 'mp4_sd_url')
  String mp4SdUrl;

  @JsonKey(name: 'mp4_hd_url')
  String mp4HdUrl;

  @JsonKey(name: 'h265_mp4_hd')
  String h265Mp4Hd;

  @JsonKey(name: 'h265_mp4_ld')
  String h265Mp4Ld;

  @JsonKey(name: 'inch_4_mp4_hd')
  String inch4Mp4Hd;

  @JsonKey(name: 'inch_5_mp4_hd')
  String inch5Mp4Hd;

  @JsonKey(name: 'inch_5_5_mp4_hd')
  String inch55Mp4Hd;

  @JsonKey(name: 'mp4_720p_mp4')
  String mp4720pMp4;

  @JsonKey(name: 'hevc_mp4_720p')
  String hevcMp4720p;

  @JsonKey(name: 'prefetch_type')
  int prefetchType;

  @JsonKey(name: 'prefetch_size')
  int prefetchSize;

  @JsonKey(name: 'act_status')
  int actStatus;

  @JsonKey(name: 'protocol')
  String protocol;

  @JsonKey(name: 'media_id')
  String mediaId;

  @JsonKey(name: 'origin_total_bitrate')
  int originTotalBitrate;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'next_title')
  String nextTitle;

  @JsonKey(name: 'play_completion_actions')
  List<ModelSearchPlayCompletionActions> playCompletionActions;

  @JsonKey(name: 'video_publish_time')
  int videoPublishTime;

  @JsonKey(name: 'play_loop_type')
  int playLoopType;

  @JsonKey(name: 'author_mid')
  String authorMid;

  @JsonKey(name: 'author_name')
  String authorName;

  @JsonKey(name: 'extra_info')
  ModelSearchExtraInfo extraInfo;

  @JsonKey(name: 'has_recommend_video')
  int hasRecommendVideo;

  @JsonKey(name: 'video_download_strategy')
  ModelSearchVideoDownloadStrategy videoDownloadStrategy;

  @JsonKey(name: 'online_users')
  String onlineUsers;

  @JsonKey(name: 'online_users_number')
  int onlineUsersNumber;

  @JsonKey(name: 'ttl')
  int ttl;

  @JsonKey(name: 'storage_type')
  String storageType;

  @JsonKey(name: 'is_keep_current_mblog')
  int isKeepCurrentMblog;

  ModelSearchMediaInfo(this.videoOrientation,this.name,this.streamUrl,this.streamUrlHd,this.h5Url,this.mp4SdUrl,this.mp4HdUrl,this.h265Mp4Hd,this.h265Mp4Ld,this.inch4Mp4Hd,this.inch5Mp4Hd,this.inch55Mp4Hd,this.mp4720pMp4,this.hevcMp4720p,this.prefetchType,this.prefetchSize,this.actStatus,this.protocol,this.mediaId,this.originTotalBitrate,this.duration,this.nextTitle,this.playCompletionActions,this.videoPublishTime,this.playLoopType,this.authorMid,this.authorName,this.extraInfo,this.hasRecommendVideo,this.videoDownloadStrategy,this.onlineUsers,this.onlineUsersNumber,this.ttl,this.storageType,this.isKeepCurrentMblog,);

  factory ModelSearchMediaInfo.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchMediaInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchMediaInfoToJson(this);

}