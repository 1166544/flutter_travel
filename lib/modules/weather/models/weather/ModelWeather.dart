import 'package:json_annotation/json_annotation.dart';

part 'ModelWeather.g.dart';

@JsonSerializable()
class ModelWeather {
	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'main')
	String main;

	@JsonKey(name: 'description')
	String description;

	@JsonKey(name: 'icon')
	String icon;

	ModelWeather({
		this.id,
		this.main,
		this.description
	});

	factory ModelWeather.fromJson(Map<String, dynamic> json) => _$ModelWeatherFromJson(json);
	Map<String, dynamic> toJson() => _$ModelWeatherToJson(this);
}