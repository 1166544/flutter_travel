import 'package:json_annotation/json_annotation.dart';

part 'ModelS6AirNowStation.g.dart';

@JsonSerializable()
class ModelS6AirNowStation {

	@JsonKey(name: 'air_sta')
    String airSta;

	@JsonKey(name: 'aqi')
    String aqi;

	@JsonKey(name: 'asid')
    String asid;

	@JsonKey(name: 'co')
    String co;

	@JsonKey(name: 'lat')
    String lat;

	@JsonKey(name: 'lon')
    String lon;

	@JsonKey(name: 'main')
    String main;

	@JsonKey(name: 'no2')
    String no2;

	@JsonKey(name: 'o3')
    String o3;

	@JsonKey(name: 'pm10')
    String pm10;

	@JsonKey(name: 'pm25')
    String pm25;

	@JsonKey(name: 'pub_time')
    String pubTime;

	@JsonKey(name: 'qlty')
    String qlty;

	@JsonKey(name: 'so2')
    String so2;

    ModelS6AirNowStation({
        this.airSta,
		this.aqi,
		this.asid,
		this.co,
		this.lat,
		this.lon,
		this.main,
		this.no2,
		this.o3,
		this.pm25,
		this.pm10,
		this.pubTime,
		this.qlty,
		this.so2
    });

    factory ModelS6AirNowStation.fromJson(Map<String, dynamic> json) => _$ModelS6AirNowStationFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6AirNowStationToJson(this);
}