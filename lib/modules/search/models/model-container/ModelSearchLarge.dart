import 'package:flutter_travel/modules/search/models/model-container/ModelSearchGeo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchLarge.g.dart';

@JsonSerializable()
class ModelSearchLarge {
    @JsonKey(name: 'size')
    String size;

    @JsonKey(name: 'url')
    String url;

    @JsonKey(name: 'geo')
    ModelSearchGeo geo;

    ModelSearchLarge({
        this.size,
		this.url,
		this.geo
    });

    factory ModelSearchLarge.fromJson(Map<String, dynamic> json) => _$ModelSearchLargeFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchLargeToJson(this);
}