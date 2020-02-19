import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchActionLog.g.dart';


@JsonSerializable()
  class ModelSearchActionLog extends Object {

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'act_code')
  String actCode;

  @JsonKey(name: 'act_type')
  String actType;

  @JsonKey(name: 'fid')
  String fid;

  @JsonKey(name: 'lfid')
  String lfid;

  @JsonKey(name: 'oid')
  String oid;

  @JsonKey(name: 'uicode')
  String uicode;

  @JsonKey(name: 'ext')
  String ext;

  ModelSearchActionLog(this.source,this.actCode,this.actType,this.fid,this.lfid,this.oid,this.uicode,this.ext,);

  factory ModelSearchActionLog.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchActionLogFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelSearchActionLogToJson(this);

}

  
