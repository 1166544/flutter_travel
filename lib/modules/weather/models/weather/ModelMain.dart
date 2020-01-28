import 'package:json_annotation/json_annotation.dart';

part 'ModelMain.g.dart';

@JsonSerializable()
class ModelMain {
	@JsonKey(name: 'temp')
	double temp;
	
	@JsonKey(name: 'feels_like')
	double feelsLike;

	@JsonKey(name: 'temp_min')
	double tempMin;

	@JsonKey(name: 'temp_max')
	double tempMax;

	@JsonKey(name: 'pressure')
	int pressure;

	@JsonKey(name: 'humidity')
	int humidity;

	ModelMain({
		this.temp,
		this.feelsLike,
		this.tempMin,
		this.tempMax,
		this.pressure,
		this.humidity
	});

	factory ModelMain.fromJson(Map<String, dynamic> json) => _$ModelMainFromJson(json);
	Map<String, dynamic> toJson() => _$ModelMainToJson(this);
}