// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelsBingItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelsBingItem _$ModelsBingItemFromJson(Map<String, dynamic> json) {
  return ModelsBingItem(
    startdate: json['startdate'] as String,
    fullstartdate: json['fullstartdate'] as String,
    enddate: json['enddate'] as String,
    url: json['url'] as String,
    urlbase: json['urlbase'] as String,
    copyright: json['copyright'] as String,
    copyrightlink: json['copyrightlink'] as String,
    title: json['title'] as String,
    quiz: json['quiz'] as String,
    wp: json['wp'] as bool,
    hsh: json['hsh'] as String,
    drk: json['drk'] as int,
    top: json['top'] as int,
    bot: json['bot'] as int,
    hs: json['hs'] as List,
  );
}

Map<String, dynamic> _$ModelsBingItemToJson(ModelsBingItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startdate', instance.startdate);
  writeNotNull('fullstartdate', instance.fullstartdate);
  writeNotNull('enddate', instance.enddate);
  writeNotNull('url', instance.url);
  writeNotNull('urlbase', instance.urlbase);
  writeNotNull('copyright', instance.copyright);
  writeNotNull('copyrightlink', instance.copyrightlink);
  writeNotNull('title', instance.title);
  writeNotNull('quiz', instance.quiz);
  writeNotNull('wp', instance.wp);
  writeNotNull('hsh', instance.hsh);
  writeNotNull('drk', instance.drk);
  writeNotNull('top', instance.top);
  writeNotNull('bot', instance.bot);
  writeNotNull('hs', instance.hs);
  return val;
}
