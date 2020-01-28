// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelWeatherList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelWeatherList _$ModelWeatherListFromJson(Map<String, dynamic> json) {
  return ModelWeatherList(
    coord: json['coord'] == null
        ? null
        : ModelCoord.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List)
        .map((e) => ModelWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String,
    main: json['main'],
    visibility: json['visibility'] as int,
    wind: json['wind'] == null
        ? null
        : ModelWind.fromJson(json['wind'] as Map<String, dynamic>),
    clouds: json['clouds'] == null
        ? null
        : ModelClouds.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    sys: json['sys'] == null
        ? null
        : ModelSys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$ModelWeatherListToJson(ModelWeatherList instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'sys': instance.sys,
      'clouds': instance.clouds,
      'timezone': instance.timezone,
      'id': instance.id,
      'dt': instance.dt,
      'name': instance.name,
      'cod': instance.cod,
    };
