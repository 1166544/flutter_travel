import 'package:flutter_travel/modules/search/models/model-container/ModelSearchActionLog.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchParams.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchButtons.g.dart';

@JsonSerializable()
class ModelSearchButtons {
    @JsonKey(name: 'type')
    String type;

    @JsonKey(name: 'name')
    String name;

    @JsonKey(name: 'pic')
    String pic;

    @JsonKey(name: 'params')
    ModelSearchParams params;

    @JsonKey(name: 'actionlog')
    ModelSearchActionLog actionlog;

    ModelSearchButtons({
        this.type,
		this.name,
		this.pic,
		this.params,
		this.actionlog
    });

    factory ModelSearchButtons.fromJson(Map<String, dynamic> json) => _$ModelSearchButtonsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchButtonsToJson(this);
}