import 'package:flutter_travel/modules/search/models/model-container/ModelSearchMblog.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchMblogBbuttons.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchCards.g.dart';

@JsonSerializable()
class ModelSearchCards {
    @JsonKey(name: 'card_type')
    int cardType;

    @JsonKey(name: 'itemid')
    String itemid;

    @JsonKey(name: 'scheme')
    String scheme;

    @JsonKey(name: 'weibo_need')
    String weiboNeed;

    @JsonKey(name: 'mblog')
    ModelSearchMblog mblog;

    @JsonKey(name: 'show_type')
    int showType;

	@JsonKey(name: 'mblog_buttons')
	List<ModelSearchMblogBbuttons> mblogBbuttons;

	@JsonKey(name: 'hot_request_id')
	String hotRequestId;

    ModelSearchCards({
        this.cardType,
		this.itemid,
		this.scheme,
		this.weiboNeed,
		this.mblog,
		this.showType,
		this.mblogBbuttons,
		this.hotRequestId
    });

    factory ModelSearchCards.fromJson(Map<String, dynamic> json) => _$ModelSearchCardsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchCardsToJson(this);
}