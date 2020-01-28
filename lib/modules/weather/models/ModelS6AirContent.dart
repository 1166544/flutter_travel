import 'package:flutter_travel/modules/weather/models/ModelS6AirNowCity.dart';
import 'package:flutter_travel/modules/weather/models/ModelS6AirNowStation.dart';
import 'package:flutter_travel/modules/weather/models/ModelS6Basic.dart';
import 'package:flutter_travel/modules/weather/models/ModelS6Update.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelS6AirContent.g.dart';

@JsonSerializable()
class ModelS6AirContent {
     @JsonKey(name: 'basic')
    ModelS6Basic basic;

    @JsonKey(name: 'update')
    ModelS6Update update;

    @JsonKey(name: 'status')
    String status;

    @JsonKey(name: 'air_now_city')
    ModelS6AirNowCity airNowCity;

    @JsonKey(name: 'air_now_station')
    List<ModelS6AirNowStation> airNowStation;

    ModelS6AirContent({
        this.basic,
		this.update,
		this.airNowCity,
		this.airNowStation
    });

    factory ModelS6AirContent.fromJson(Map<String, dynamic> json) => _$ModelS6AirContentFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6AirContentToJson(this);
}
