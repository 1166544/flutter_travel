import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6HeWeather6.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Weather.g.dart';

@JsonSerializable()
class ModelS6Weather {
    @JsonKey(name: 'HeWeather6')
    List<ModelS6HeWeather6> heWeather6;

    ModelS6Weather({
        this.heWeather6,
    });

    factory ModelS6Weather.fromJson(Map<String, dynamic> json) => _$ModelS6WeatherFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6WeatherToJson(this);
}