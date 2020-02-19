// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchNumberDisplayStrategy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchNumberDisplayStrategy _$ModelSearchNumberDisplayStrategyFromJson(
    Map<String, dynamic> json) {
  return ModelSearchNumberDisplayStrategy(
    json['apply_scenario_flag'] as int,
    json['display_text_min_number'] as int,
    json['display_text'] as String,
  );
}

Map<String, dynamic> _$ModelSearchNumberDisplayStrategyToJson(
        ModelSearchNumberDisplayStrategy instance) =>
    <String, dynamic>{
      'apply_scenario_flag': instance.applyScenarioFlag,
      'display_text_min_number': instance.displayTextMinNumber,
      'display_text': instance.displayText,
    };
