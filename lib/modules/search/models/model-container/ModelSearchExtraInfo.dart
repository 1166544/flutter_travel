import 'package:json_annotation/json_annotation.dart'; 

part 'ModelSearchExtraInfo.g.dart';

@JsonSerializable()
class ModelSearchExtraInfo extends Object {

  @JsonKey(name: 'sceneid')
  String sceneid;

  ModelSearchExtraInfo(this.sceneid,);

  factory ModelSearchExtraInfo.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchExtraInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchExtraInfoToJson(this);

}