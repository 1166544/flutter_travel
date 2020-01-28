// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6DailyForecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6DailyForecast _$ModelS6DailyForecastFromJson(Map<String, dynamic> json) {
  return ModelS6DailyForecast(
    condCodeD: json['cond_code_d'] as String,
    condCodeN: json['cond_code_n'] as String,
    condTxtD: json['cond_txt_d'] as String,
    condTxtN: json['cond_txt_n'] as String,
    date: json['date'] as String,
    hum: json['hum'] as String,
    mr: json['mr'] as String,
    ms: json['ms'] as String,
    pcpn: json['pcpn'] as String,
    pop: json['pop'] as String,
    pres: json['pres'] as String,
    sr: json['sr'] as String,
    ss: json['ss'] as String,
    tmpMax: json['tmp_max'] as String,
    tmpMin: json['tmp_min'] as String,
    uvIndex: json['uv_index'] as String,
    vis: json['vis'] as String,
    windDeg: json['wind_deg'] as String,
    windDir: json['wind_dir'] as String,
    windSc: json['wind_sc'] as String,
    windSpd: json['wind_spd'] as String,
  );
}

Map<String, dynamic> _$ModelS6DailyForecastToJson(
        ModelS6DailyForecast instance) =>
    <String, dynamic>{
      'cond_code_d': instance.condCodeD,
      'cond_code_n': instance.condCodeN,
      'cond_txt_d': instance.condTxtD,
      'cond_txt_n': instance.condTxtN,
      'date': instance.date,
      'hum': instance.hum,
      'mr': instance.mr,
      'ms': instance.ms,
      'pcpn': instance.pcpn,
      'pop': instance.pop,
      'pres': instance.pres,
      'sr': instance.sr,
      'ss': instance.ss,
      'tmp_max': instance.tmpMax,
      'tmp_min': instance.tmpMin,
      'uv_index': instance.uvIndex,
      'vis': instance.vis,
      'wind_deg': instance.windDeg,
      'wind_dir': instance.windDir,
      'wind_sc': instance.windSc,
      'wind_spd': instance.windSpd,
    };
