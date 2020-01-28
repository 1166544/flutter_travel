import 'package:json_annotation/json_annotation.dart';

part 'ModelClouds.g.dart';

@JsonSerializable()
class ModelClouds {
	@JsonKey(name: 'all')
	int all;

	ModelClouds({
		this.all
	});

	factory ModelClouds.fromJson(Map<String, dynamic> json) => _$ModelCloudsFromJson(json);
	Map<String, dynamic> toJson() => _$ModelCloudsToJson(this);
}