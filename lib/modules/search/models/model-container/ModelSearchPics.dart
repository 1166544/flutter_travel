import 'package:flutter_travel/modules/search/models/model-container/ModelSearchGeo.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchLarge.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchPics.g.dart';

@JsonSerializable()
class ModelSearchPics {
    @JsonKey(name: 'pid')
    String pid;

    @JsonKey(name: 'url')
    String url;

    @JsonKey(name: 'size')
    String size;

    @JsonKey(name: 'geo')
    ModelSearchGeo geo;

    @JsonKey(name: 'large')
    ModelSearchLarge large;

    ModelSearchPics({
        this.pid,
		this.url,
		this.size,
		this.geo,
		this.large
    });

    factory ModelSearchPics.fromJson(Map<String, dynamic> json) => _$ModelSearchPicsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchPicsToJson(this);
}