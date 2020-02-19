// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelSearchTabData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSearchTabData _$ModelSearchTabDataFromJson(Map<String, dynamic> json) {
  return ModelSearchTabData(
    groups: json['groups'] as List,
    channel: (json['channel'] as List)
        ?.map((e) => e == null
            ? null
            : ModelSearchTabChannel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hot: json['hot'] == null
        ? null
        : ModelSearchHot.fromJson(json['hot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelSearchTabDataToJson(ModelSearchTabData instance) =>
    <String, dynamic>{
      'groups': instance.groups,
      'channel': instance.channel,
      'hot': instance.hot,
    };
