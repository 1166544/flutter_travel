
import 'package:flutter_travel/modules/search/models/ModelSearchHot.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchTabChannel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchTabData.g.dart';

@JsonSerializable()
class ModelSearchTabData {
	@JsonKey(name: 'groups')
	List<dynamic> groups;

	@JsonKey(name: 'channel')
	List<ModelSearchTabChannel> channel;

	@JsonKey(name: 'hot')
	ModelSearchHot hot;

	ModelSearchTabData({this.groups, this.channel, this.hot});

	// 序列化与反序列化
	factory ModelSearchTabData.fromJson(Map<String, dynamic> json) => _$ModelSearchTabDataFromJson(json);
	Map<String, dynamic> toJson() => _$ModelSearchTabDataToJson(this);
}