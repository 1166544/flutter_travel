import 'package:json_annotation/json_annotation.dart';

part 'ModelS6AirNowCity.g.dart';

@JsonSerializable()
class ModelS6AirNowCity {
	@JsonKey(name: 'aqi')
    String aqi;

	@JsonKey(name: 'qlty')
    String qlty;

	@JsonKey(name: 'main')
    String main;

	@JsonKey(name: 'pm25')
    String pm25;

	@JsonKey(name: 'pm10')
    String pm10;

	@JsonKey(name: 'no2')
    String no2;

	@JsonKey(name: 'so2')
    String so2;

	@JsonKey(name: 'co')
    String co;

	@JsonKey(name: 'o3')
    String o3;

	@JsonKey(name: 'pub_time')
    String pubTime;

    ModelS6AirNowCity({
        this.aqi,
		this.qlty,
		this.main,
		this.pm10,
		this.pm25,
		this.no2,
		this.so2,
		this.co,
		this.o3,
		this.pubTime
    });

    factory ModelS6AirNowCity.fromJson(Map<String, dynamic> json) => _$ModelS6AirNowCityFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6AirNowCityToJson(this);
}
