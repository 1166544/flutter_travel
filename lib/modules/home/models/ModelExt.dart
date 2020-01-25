import 'package:json_annotation/json_annotation.dart';

part 'ModelExt.g.dart';

@JsonSerializable()
class ModelExt {
	@JsonKey(name: 'ac')
	String ac;

	@JsonKey(name: 'auth')
	int auth;

	@JsonKey(name: 'cms')
	int cms;

	@JsonKey(name: 'content_type')
	int contentType;

	@JsonKey(name: 'interact')
	int interact;

	@JsonKey(name: 'qid')
	String qid;

	@JsonKey(name: 'readcnt')
	int readcnt;

	@JsonKey(name: 'ts')
	int ts;

	/// 构造体
	ModelExt({this.ac, this.auth, this.cms, this.contentType, this.interact, this.qid, this.readcnt, this.ts});

	// 序列化与反序列化
	factory ModelExt.fromJson(Map<String, dynamic> json) => _$ModelExtFromJson(json);
	Map<String, dynamic> toJson() => _$ModelExtToJson(this);

	void update(dynamic resultData) {
		if (resultData != null) {
			this.ac = resultData['ac'];
			this.auth = resultData['auth'];
			this.cms = resultData['cms'];
			this.contentType = resultData['content_type'];
			this.interact = resultData['interact'];
			this.qid = resultData['qid'];
			this.readcnt = resultData['readcnt'];
			this.ts = resultData['ts'];
		}
	}
}