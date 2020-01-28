import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Now.g.dart';

@JsonSerializable()
class ModelS6Now {
    @JsonKey(name: 'cloud')
    String cloud;
	
    @JsonKey(name: 'cond_code')
    String condCode;

    @JsonKey(name: 'cond_txt')
    String condTxt;

    @JsonKey(name: 'fl')
    String fl;

    @JsonKey(name: 'hum')
    String hum;

    @JsonKey(name: 'pcpn')
    String pcpn;

    @JsonKey(name: 'pres')
    String pres;

    @JsonKey(name: 'tmp')
    String tmp;

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

    ModelS6Now({
        this.cloud,
		this.condCode,
		this.condTxt,
		this.fl,
		this.hum,
		this.pcpn,
		this.pres,
		this.tmp,
		this.vis,
		this.windDeg,
		this.windDir,
		this.windSc,
		this.windSpd,
    });

    factory ModelS6Now.fromJson(Map<String, dynamic> json) => _$ModelS6NowFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6NowToJson(this);
}