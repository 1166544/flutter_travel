import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Basic.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6DailyForecast.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Hourly.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Lifestyle.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Now.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Update.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelS6HeWeather6.g.dart';

@JsonSerializable()
class ModelS6HeWeather6 {
    @JsonKey(name: 'basic')
    ModelS6Basic basic;

    @JsonKey(name: 'update')
    ModelS6Update update;

    @JsonKey(name: 'status')
    String status;

    @JsonKey(name: 'now')
    ModelS6Now now;

    @JsonKey(name: 'daily_forecast')
    List<ModelS6DailyForecast> dailyForecast;

    @JsonKey(name: 'hourly')
    List<ModelS6Hourly> hourly;

    @JsonKey(name: 'lifestyle')
    List<ModelS6Lifestyle> lifestyle;

    ModelS6HeWeather6({
        this.basic,
		this.update,
		this.status,
		this.now,
		this.dailyForecast,
		this.hourly,
		this.lifestyle
    });

    factory ModelS6HeWeather6.fromJson(Map<String, dynamic> json) => _$ModelS6HeWeather6FromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6HeWeather6ToJson(this);
}