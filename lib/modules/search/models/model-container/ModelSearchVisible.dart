import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchVisible.g.dart';

@JsonSerializable()
class ModelSearchVisible {
    @JsonKey(name: 'type')
    int type;

    @JsonKey(name: 'list_id')
    int listId;

    ModelSearchVisible({
        this.type,
		this.listId
    });

    factory ModelSearchVisible.fromJson(Map<String, dynamic> json) => _$ModelSearchVisibleFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchVisibleToJson(this);
}