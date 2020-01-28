import 'package:flutter_travel/modules/weather/models/air/ModelS6AirContent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Air.g.dart';

/// 空气质量信息
@JsonSerializable()
class ModelS6Air {
    @JsonKey(name: 'HeWeather6')
    List<ModelS6AirContent> heWeather6;

    ModelS6Air({
        this.heWeather6,
    });

    factory ModelS6Air.fromJson(Map<String, dynamic> json) => _$ModelS6AirFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6AirToJson(this);
}