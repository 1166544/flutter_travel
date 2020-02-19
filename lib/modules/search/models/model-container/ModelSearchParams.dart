import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchParams.g.dart';

@JsonSerializable()
class ModelSearchParams {
    @JsonKey(name: 'uid')
    String uid;

    ModelSearchParams({
        this.uid,
    });

    factory ModelSearchParams.fromJson(Map<String, dynamic> json) => _$ModelSearchParamsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchParamsToJson(this);
}