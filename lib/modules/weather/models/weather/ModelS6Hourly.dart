import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Hourly.g.dart';

@JsonSerializable()
class ModelS6Hourly {

	@JsonKey(name: 'cloud')
    String cloud;

	@JsonKey(name: 'cond_code')
    String condCode;

	@JsonKey(name: 'cond_txt')
    String condTxt;

	@JsonKey(name: 'dew')
    String dew;

	@JsonKey(name: 'hum')
    String hum;

	@JsonKey(name: 'pop')
    String pop;

	@JsonKey(name: 'pres')
    String pres;

	@JsonKey(name: 'time')
    String time;

	@JsonKey(name: 'tmp')
    String tmp;

	@JsonKey(name: 'wind_deg')
    String windDeg;

	@JsonKey(name: 'wind_dir')
    String windDir;

	@JsonKey(name: 'wind_sc')
    String windSc;

	@JsonKey(name: 'wind_spd')
    String windSpd;

    ModelS6Hourly({
        this.cloud,
		this.condCode,
		this.condTxt,
		this.dew,
		this.hum,
		this.pop,
		this.pres,
		this.time,
		this.tmp,
		this.windDeg,
		this.windDir,
		this.windSc,
		this.windSpd
    });

    factory ModelS6Hourly.fromJson(Map<String, dynamic> json) => _$ModelS6HourlyFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6HourlyToJson(this);
}