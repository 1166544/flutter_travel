import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Lifestyle.g.dart';

@JsonSerializable()
class ModelS6Lifestyle {
    @JsonKey(name: 'comf')
    String comf;

    @JsonKey(name: 'brf')
    String brf;

    @JsonKey(name: 'txt')
    String txt;

    ModelS6Lifestyle({
        this.comf,
		this.brf,
		this.txt
    });

    factory ModelS6Lifestyle.fromJson(Map<String, dynamic> json) => _$ModelS6LifestyleFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6LifestyleToJson(this);
}