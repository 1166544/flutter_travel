import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchGeo.g.dart';


@JsonSerializable()
class ModelSearchGeo extends Object {

  @JsonKey(name: 'width')
  dynamic width;

  @JsonKey(name: 'height')
  dynamic height;

  @JsonKey(name: 'croped')
  bool croped;

  ModelSearchGeo(this.width,this.height,this.croped,);

  factory ModelSearchGeo.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchGeoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchGeoToJson(this);

}

  
