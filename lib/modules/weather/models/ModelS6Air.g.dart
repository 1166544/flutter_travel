// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelS6Air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelS6Air _$ModelS6AirFromJson(Map<String, dynamic> json) {
  return ModelS6Air(
    heWeather6: (json['HeWeather6'] as List)
        ?.map((e) => e == null
            ? null
            : ModelS6AirContent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModelS6AirToJson(ModelS6Air instance) =>
    <String, dynamic>{
      'HeWeather6': instance.heWeather6,
    };
