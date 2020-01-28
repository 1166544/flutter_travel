import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Update.g.dart';

@JsonSerializable()
class ModelS6Update {
    @JsonKey(name: 'loc')
    String loc;

    @JsonKey(name: 'utc')
    String utc;

    ModelS6Update({
        this.loc,
		this.utc
    });

    factory ModelS6Update.fromJson(Map<String, dynamic> json) => _$ModelS6UpdateFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6UpdateToJson(this);
}