import 'package:json_annotation/json_annotation.dart';

part 'ModelWind.g.dart';

@JsonSerializable()
class ModelWind {
	@JsonKey(name: 'speed')
	int speed;

	@JsonKey(name: 'deg')
	int deg;

	ModelWind({
		this.speed,
		this.deg
	});

	factory ModelWind.fromJson(Map<String, dynamic> json) => _$ModelWindFromJson(json);
	Map<String, dynamic> toJson() => _$ModelWindToJson(this);
}