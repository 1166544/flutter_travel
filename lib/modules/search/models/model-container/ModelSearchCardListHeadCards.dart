import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchCardListHeadCards.g.dart';

@JsonSerializable()
class ModelSearchCardListHeadCards {
    @JsonKey(name: 'channel_list')
    dynamic channelList;

    ModelSearchCardListHeadCards({
        this.channelList,
    });

    factory ModelSearchCardListHeadCards.fromJson(Map<String, dynamic> json) => _$ModelSearchCardListHeadCardsFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchCardListHeadCardsToJson(this);
}