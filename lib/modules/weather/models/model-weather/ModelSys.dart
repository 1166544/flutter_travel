import 'package:json_annotation/json_annotation.dart';

part 'ModelSys.g.dart';

@JsonSerializable()
class ModelSys {
	@JsonKey(name: 'type')
	int type;
	
	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'country')
	String country;

	@JsonKey(name: 'sunrise')
	int sunrise;

	@JsonKey(name: 'sunset')
	int sunset;

	ModelSys({
		this.type,
		this.id,
		this.country,
		this.sunrise,
		this.sunset
	});

	factory ModelSys.fromJson(Map<String, dynamic> json) => _$ModelSysFromJson(json);
	Map<String, dynamic> toJson() => _$ModelSysToJson(this);
}