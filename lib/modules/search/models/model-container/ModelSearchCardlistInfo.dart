import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCardListHeadCards.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchCardlistInfo.g.dart';

@JsonSerializable()
class ModelSearchCardlistInfo {
    @JsonKey(name: 'v_p')
    String vp;

    @JsonKey(name: 'statistics_from')
    String statisticsFrom;

    @JsonKey(name: 'containerid')
    String containerid;

    @JsonKey(name: 'title_top')
    String titleTop;

    @JsonKey(name: 'show_style')
    int showStyle;

    @JsonKey(name: 'total')
    int total;

    @JsonKey(name: 'can_shared')
    int canShared;

    @JsonKey(name: 'since_id')
    int sinceId;

    @JsonKey(name: 'cardlist_title')
    String cardlistTitle;

    @JsonKey(name: 'desc')
    String desc;

    @JsonKey(name: 'cardlist_head_cards')
    ModelSearchCardListHeadCards cardlistHeadCards;

    ModelSearchCardlistInfo({
        this.vp,
		this.statisticsFrom,
		this.containerid,
		this.titleTop,
		this.showStyle,
		this.total,
		this.canShared,
		this.sinceId,
		this.cardlistTitle,
		this.desc,
		this.cardlistHeadCards
    });

    factory ModelSearchCardlistInfo.fromJson(Map<String, dynamic> json) => _$ModelSearchCardlistInfoFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchCardlistInfoToJson(this);
}