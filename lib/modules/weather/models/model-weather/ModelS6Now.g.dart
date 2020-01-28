// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6Now.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6Now _$ModelS6NowFromJson(Map<String, dynamic> json) {
  return ModelS6Now(
    cloud: json['cloud'] as String,
    condCode: json['cond_code'] as String,
    condTxt: json['cond_txt'] as String,
    fl: json['fl'] as String,
    hum: json['hum'] as String,
    pcpn: json['pcpn'] as String,
    pres: json['pres'] as String,
    tmp: json['tmp'] as String,
    vis: json['vis'] as String,
    windDeg: json['wind_deg'] as String,
    windDir: json['wind_dir'] as String,
    windSc: json['wind_sc'] as String,
    windSpd: json['wind_spd'] as String,
  );
}

Map<String, dynamic> _$ModelS6NowToJson(ModelS6Now instance) =>
    <String, dynamic>{
      'cloud': instance.cloud,
      'cond_code': instance.condCode,
      'cond_txt': instance.condTxt,
      'fl': instance.fl,
      'hum': instance.hum,
      'pcpn': instance.pcpn,
      'pres': instance.pres,
      'tmp': instance.tmp,
      'vis': instance.vis,
      'wind_deg': instance.windDeg,
      'wind_dir': instance.windDir,
      'wind_sc': instance.windSc,
      'wind_spd': instance.windSpd,
    };
