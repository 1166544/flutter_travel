import 'package:flutter_travel/modules/search/models/model-container/ModelSearchActionLog.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchMblogButtons.g.dart';

@JsonSerializable()
class ModelSearchMblogButtons {
    @JsonKey(name: 'type')
    String type;

    @JsonKey(name: 'name')
    String name;

    @JsonKey(name: 'pic')
    String pic;

    @JsonKey(name: 'actionlog')
    ModelSearchActionLog actionlog;

    ModelSearchMblogButtons({
        this.type,
		this.name,
		this.pic,
		this.actionlog
    });

    factory ModelSearchMblogButtons.fromJson(Map<String, dynamic> json) => _$ModelSearchMblogButtonsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchMblogButtonsToJson(this);
}