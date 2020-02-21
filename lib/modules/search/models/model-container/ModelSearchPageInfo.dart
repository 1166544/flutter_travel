import 'package:flutter_travel/modules/search/models/model-container/ModelSearchMediaInfo.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchPagePic.dart';
import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchPageInfo.g.dart';

@JsonSerializable()
  class ModelSearchPageInfo extends Object {

  @JsonKey(name: 'page_pic')
  ModelSearchPagePic pagePic;

  @JsonKey(name: 'page_url')
  String pageUrl;

  @JsonKey(name: 'page_title')
  String pageTitle;

  @JsonKey(name: 'content1')
  String content1;

  @JsonKey(name: 'content2')
  String content2;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'media_info')
  ModelSearchMediaInfo mediaInfo;

  @JsonKey(name: 'play_count')
  int playCount;

  @JsonKey(name: 'object_id')
  String objectId;

  ModelSearchPageInfo(this.pagePic,this.pageUrl,this.pageTitle,this.content1,this.content2,this.type,this.mediaInfo,this.playCount,this.objectId,);

  factory ModelSearchPageInfo.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchPageInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchPageInfoToJson(this);

}