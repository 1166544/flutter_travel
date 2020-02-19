import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchBedge.g.dart';


@JsonSerializable()
class ModelSearchBedge extends Object {

  @JsonKey(name: 'unread_pool')
  int unreadPool;

  @JsonKey(name: 'user_name_certificate')
  int userNameCertificate;

  @JsonKey(name: 'national_day_2018')
  int nationalDay2018;

  @JsonKey(name: 'weibo_display_fans')
  int weiboDisplayFans;

  @JsonKey(name: 'relation_display')
  int relationDisplay;

  @JsonKey(name: 'wusi_2019')
  int wusi2019;

  @JsonKey(name: 'hongrenjie_2019')
  int hongrenjie2019;

  @JsonKey(name: 'hongbao_2020')
  int hongbao2020;

  ModelSearchBedge({this.unreadPool,this.userNameCertificate,this.nationalDay2018,this.weiboDisplayFans,this.relationDisplay,this.wusi2019,this.hongrenjie2019,this.hongbao2020});

  factory ModelSearchBedge.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchBedgeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchBedgeToJson(this);

}