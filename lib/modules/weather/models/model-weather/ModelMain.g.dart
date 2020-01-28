// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelMain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelMain _$ModelMainFromJson(Map<String, dynamic> json) {
  return ModelMain(
    temp: (json['temp'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
    tempMin: (json['temp_min'] as num)?.toDouble(),
    tempMax: (json['temp_max'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
  );
}

Map<String, dynamic> _$ModelMainToJson(ModelMain instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
