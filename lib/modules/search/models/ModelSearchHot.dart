
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchHot.g.dart';

@JsonSerializable()
class ModelSearchHot {
	@JsonKey(name: 'ok')
	int ok;

	@JsonKey(name: 'hotWord')
	String hotWord;
	
	@JsonKey(name: 'scheme')
	String scheme;

	ModelSearchHot({this.ok, this.hotWord, this.scheme});

	// 序列化与反序列化
	factory ModelSearchHot.fromJson(Map<String, dynamic> json) => _$ModelSearchHotFromJson(json);
	Map<String, dynamic> toJson() => _$ModelSearchHotToJson(this);
}