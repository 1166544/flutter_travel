// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6Weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6Weather _$ModelS6WeatherFromJson(Map<String, dynamic> json) {
  return ModelS6Weather(
    heWeather6: (json['HeWeather6'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6HeWeather6.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModelS6WeatherToJson(ModelS6Weather instance) =>
    <String, dynamic>{
      'HeWeather6': instance.heWeather6,
    };
