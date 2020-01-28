import 'package:flutter_travel/modules/weather/models/model-weather/ModelClouds.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelCoord.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelMain.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelSys.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelWeather.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelWind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelWeatherList.g.dart';

@JsonSerializable()
class ModelWeatherList {
	@JsonKey(name: 'coord')
	ModelCoord coord;

	@JsonKey(name: 'weather', nullable: false)
	List<ModelWeather> weather;

	@JsonKey(name: 'base')
	String base;

	@JsonKey(name: 'main')
	ModelMain main;

	@JsonKey(name: 'visibility')
	int visibility;

	@JsonKey(name: 'wind')
	ModelWind wind;

	@JsonKey(name: 'sys')
	ModelSys sys;

	@JsonKey(name: 'clouds')
	ModelClouds clouds;

	@JsonKey(name: 'timezone')
	int timezone;

	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'dt')
	int dt;

	@JsonKey(name: 'name')
	String name;

	@JsonKey(name: 'cod')
	int cod;

	ModelWeatherList({
		this.coord,
		List<ModelWeather> weather,
		this.base,
		this.main,
		this.visibility,
		this.wind,
		this.clouds,
		this.dt,
		this.sys,
		this.timezone,
		this.id,
		this.name,
		this.cod
	}): weather = weather ?? <ModelWeather> [];
	
	factory ModelWeatherList.fromJson(Map<String, dynamic> json) => _$ModelWeatherListFromJson(json);
	Map<String, dynamic> toJson() => _$ModelWeatherListToJson(this);
}