import 'package:flutter_travel/modules/search/models/model-container/ModelSearchContainer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchList.g.dart';

@JsonSerializable()
class ModelSearchList {
    @JsonKey(name: 'data')
    ModelSearchContainer data;

    @JsonKey(name: 'ok')
    int ok;

    ModelSearchList({
        this.data,
		this.ok
    });

    factory ModelSearchList.fromJson(Map<String, dynamic> json) => _$ModelSearchListFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchListToJson(this);
}