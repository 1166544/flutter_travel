import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCardlistInfo.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchContainer.g.dart';

@JsonSerializable()
class ModelSearchContainer {
    @JsonKey(name: 'cardlistInfo')
    ModelSearchCardlistInfo cardlistInfo;

    @JsonKey(name: 'cards')
    List<ModelSearchCards> cards;

    @JsonKey(name: 'banners')
    dynamic banners;

    @JsonKey(name: 'scheme')
    String scheme;

    @JsonKey(name: 'showAppTips')
    int showAppTips;

    @JsonKey(name: 'openApp')
    int openApp;

    ModelSearchContainer({
        this.cardlistInfo,
		this.banners,
		this.scheme,
		this.showAppTips,
		this.openApp
    });

    factory ModelSearchContainer.fromJson(Map<String, dynamic> json) => _$ModelSearchContainerFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchContainerToJson(this);
}