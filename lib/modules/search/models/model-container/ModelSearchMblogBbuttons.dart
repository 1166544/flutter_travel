import 'package:flutter_travel/modules/search/models/model-container/ModelSearchActionLog.dart';
import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchMblogBbuttons.g.dart';


@JsonSerializable()
  class ModelSearchMblogBbuttons extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'actionlog')
  ModelSearchActionLog actionlog;

  ModelSearchMblogBbuttons(this.type,this.name,this.pic,this.actionlog);

  factory ModelSearchMblogBbuttons.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchMblogBbuttonsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchMblogBbuttonsToJson(this);

}

  
