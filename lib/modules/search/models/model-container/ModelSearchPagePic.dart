import 'package:json_annotation/json_annotation.dart'; 

part 'ModelSearchPagePic.g.dart';

@JsonSerializable()
class ModelSearchPagePic extends Object {

  @JsonKey(name: 'url')
  String url;

  ModelSearchPagePic(this.url,);

  factory ModelSearchPagePic.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchPagePicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchPagePicToJson(this);

}