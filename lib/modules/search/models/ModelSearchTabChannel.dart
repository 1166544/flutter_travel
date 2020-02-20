
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchTabChannel.g.dart';

@JsonSerializable()
class ModelSearchTabChannel {

	@JsonKey(name: 'gid')
	String gid;

	@JsonKey(name: 'name')
	String name;

	@JsonKey(name: 'type')
	String type;

	ModelSearchTabChannel({this.gid, this.name, this.type});

	// 序列化与反序列化
	factory ModelSearchTabChannel.fromJson(Map<String, dynamic> json) => _$ModelSearchTabChannelFromJson(json);
	Map<String, dynamic> toJson() => _$ModelSearchTabChannelToJson(this);
}