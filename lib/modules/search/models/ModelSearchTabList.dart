
import 'package:flutter_travel/modules/search/models/ModelSearchTabData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchTabList.g.dart';

/// TAB列表
@JsonSerializable()
class ModelSearchTabList {
	@JsonKey(name: 'ok')
	int ok;

	@JsonKey(name: 'data')
	ModelSearchTabData data;

	ModelSearchTabList({this.ok, this.data});

	// 序列化与反序列化
	factory ModelSearchTabList.fromJson(Map<String, dynamic> json) => _$ModelSearchTabListFromJson(json);
	Map<String, dynamic> toJson() => _$ModelSearchTabListToJson(this);
}