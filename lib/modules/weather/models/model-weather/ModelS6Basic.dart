import 'package:json_annotation/json_annotation.dart';

part 'ModelS6Basic.g.dart';

@JsonSerializable()
class ModelS6Basic {
    @JsonKey(name: 'cid')
    String cid;

    @JsonKey(name: 'location')
    String location;

    @JsonKey(name: 'parent_city')
    String parentCity;

    @JsonKey(name: 'admin_area')
    String adminArea;

    @JsonKey(name: 'cnty')
    String cnty;

    @JsonKey(name: 'lat')
    String lat;

    @JsonKey(name: 'lon')
    String lon;

    @JsonKey(name: 'tz')
    String tz;

    ModelS6Basic({
        this.cid,
		this.location,
		this.parentCity,
		this.adminArea,
		this.cnty,
		this.lat,
		this.lon,
		this.tz
    });

    factory ModelS6Basic.fromJson(Map<String, dynamic> json) => _$ModelS6BasicFromJson(json);
    Map<String, dynamic> toJson() => _$ModelS6BasicToJson(this);
}