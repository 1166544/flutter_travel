  
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchActionLog.dart';
import 'package:json_annotation/json_annotation.dart'; 

part 'ModelSearchPlayCompletionActions.g.dart';

@JsonSerializable()
class ModelSearchPlayCompletionActions extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'btn_code')
  int btnCode;

  @JsonKey(name: 'show_position')
  int showPosition;

  @JsonKey(name: 'actionlog')
  ModelSearchActionLog actionlog;

  ModelSearchPlayCompletionActions(this.type,this.icon,this.text,this.link,this.btnCode,this.showPosition,this.actionlog,);

  factory ModelSearchPlayCompletionActions.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchPlayCompletionActionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchPlayCompletionActionsToJson(this);

}