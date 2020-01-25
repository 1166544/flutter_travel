import 'package:flutter_travel/modules/splash/models/ModelsBingItem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelsBing.g.dart';

@JsonSerializable()
class ModelsBing {

	@JsonKey(name: 'images', nullable: false)
	List<ModelsBingItem> images;

	ModelsBing({List<ModelsBingItem> images}): images = images ?? <ModelsBingItem> [];

	factory ModelsBing.fromJson(Map<String, dynamic> json) => _$ModelsBingFromJson(json);
	Map<String, dynamic> toJson() => _$ModelsBingToJson(this);

	// void update(dynamic resultData) {
	// 	if (resultData != null) {
	// 		this.name = resultData['name'];
	// 		this.rimShow = resultData['rim_show'];
	// 	}
	// }
}