// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6Hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6Hourly _$ModelS6HourlyFromJson(Map<String, dynamic> json) {
  return ModelS6Hourly(
    cloud: json['cloud'] as String,
    condCode: json['cond_code'] as String,
    condTxt: json['cond_txt'] as String,
    dew: json['dew'] as String,
    hum: json['hum'] as String,
    pop: json['pop'] as String,
    pres: json['pres'] as String,
    time: json['time'] as String,
    tmp: json['tmp'] as String,
    windDeg: json['wind_deg'] as String,
    windDir: json['wind_dir'] as String,
    windSc: json['wind_sc'] as String,
    windSpd: json['wind_spd'] as String,
  );
}

Map<String, dynamic> _$ModelS6HourlyToJson(ModelS6Hourly instance) =>
    <String, dynamic>{
      'cloud': instance.cloud,
      'cond_code': instance.condCode,
      'cond_txt': instance.condTxt,
      'dew': instance.dew,
      'hum': instance.hum,
      'pop': instance.pop,
      'pres': instance.pres,
      'time': instance.time,
      'tmp': instance.tmp,
      'wind_deg': instance.windDeg,
      'wind_dir': instance.windDir,
      'wind_sc': instance.windSc,
      'wind_spd': instance.windSpd,
    };
