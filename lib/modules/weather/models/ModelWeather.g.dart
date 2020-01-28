// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelWeather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelWeather _$ModelWeatherFromJson(Map<String, dynamic> json) {
  return ModelWeather(
    id: json['id'] as int,
    main: json['main'] as String,
    description: json['description'] as String,
  )..icon = json['icon'] as String;
}

Map<String, dynamic> _$ModelWeatherToJson(ModelWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
