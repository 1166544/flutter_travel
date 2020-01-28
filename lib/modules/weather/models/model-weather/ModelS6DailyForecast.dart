import 'package:json_annotation/json_annotation.dart';

part 'ModelS6DailyForecast.g.dart';

@JsonSerializable()
class ModelS6DailyForecast {

	@JsonKey(name: 'cond_code_d')
    String condCodeD;

	@JsonKey(name: 'cond_code_n')
    String condCodeN;

	@JsonKey(name: 'cond_txt_d')
    String condTxtD;

	@JsonKey(name: 'cond_txt_n')
    String condTxtN;

	@JsonKey(name: 'date')
    String date;

	@JsonKey(name: 'hum')
    String hum;

	@JsonKey(name: 'mr')
    String mr;

	@JsonKey(name: 'ms')
    String ms;

	@JsonKey(name: 'pcpn')
    String pcpn;

	@JsonKey(name: 'pop')
    String pop;

	@JsonKey(name: 'pres')
    String pres;

	@JsonKey(name: 'sr')
    String sr;

	@JsonKey(name: 'ss')
    String ss;

	@JsonKey(name: 'tmp_max')
    String tmpMax;

	@JsonKey(name: 'tmp_min')
    String tmpMin;

	@JsonKey(name: 'uv_index')
    String uvIndex;

	@JsonKey(name: 'vis')
    String vis;

	@JsonKey(name: 'wind_deg')
    String windDeg;

	@JsonKey(name: 'wind_dir')
    String windDir;

	@JsonKey(name: 'wind_sc')
    String windSc;

	@JsonKey(name: 'wind_spd')
    String windSpd;

    ModelS6DailyForecast({
        this.condCodeD,
		this.condCodeN,
		this.condTxtD,
		this.condTxtN,
		this.date,
		this.hum,
		this.mr,
		this.ms,
		this.pcpn,
		this.pop,
		this.pres,
		this.sr,
		this.ss,
		this.tmpMax,
		this.tmpMin,
		this.uvIndex,
		this.vis,
		this.windDeg,
		this.windDir,
		this.windSc,
		this.windSpd,
    });

    factory ModelS6DailyForecast.fromJson(Map<String, dynamic> json) => _$ModelS6DailyForecastFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6DailyForecastToJson(this);
}