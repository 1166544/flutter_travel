import 'package:json_annotation/json_annotation.dart';

part 'ModelCoord.g.dart';

@JsonSerializable()
class ModelCoord {
	@JsonKey(name: 'lon')
	double lon;

	@JsonKey(name: 'lat')
	double lat;

	ModelCoord({
		this.lon,
		this.lat
	});

	factory ModelCoord.fromJson(Map<String, dynamic> json) => _$ModelCoordFromJson(json);
	Map<String, dynamic> toJson() => _$ModelCoordToJson(this);
}