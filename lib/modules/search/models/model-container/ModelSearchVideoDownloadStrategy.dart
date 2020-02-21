  
import 'package:json_annotation/json_annotation.dart'; 

part 'ModelSearchVideoDownloadStrategy.g.dart';

@JsonSerializable()
class ModelSearchVideoDownloadStrategy extends Object {

  @JsonKey(name: 'abandon_download')
  int abandonDownload;

  ModelSearchVideoDownloadStrategy(this.abandonDownload,);

  factory ModelSearchVideoDownloadStrategy.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchVideoDownloadStrategyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchVideoDownloadStrategyToJson(this);

}