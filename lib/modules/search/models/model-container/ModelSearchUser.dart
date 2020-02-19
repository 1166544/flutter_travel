import 'package:flutter_travel/modules/search/models/model-container/ModelSearchBedge.dart';
import 'package:json_annotation/json_annotation.dart'; 
  
part 'ModelSearchUser.g.dart';


@JsonSerializable()
class ModelSearchUser extends Object {

	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'screen_name')
	String screenName;

	@JsonKey(name: 'profile_image_url')
	String profileImageUrl;

	@JsonKey(name: 'profile_url')
	String profileUrl;

	@JsonKey(name: 'statuses_count')
	int statusesCount;

	@JsonKey(name: 'verified')
	bool verified;

	@JsonKey(name: 'verified_type')
	int verifiedType;

	@JsonKey(name: 'close_blue_v')
	bool closeBlueV;

	@JsonKey(name: 'description')
	String description;

	@JsonKey(name: 'gender')
	String gender;

	@JsonKey(name: 'mbtype')
	int mbtype;

	@JsonKey(name: 'urank')
	int urank;

	@JsonKey(name: 'mbrank')
	int mbrank;

	@JsonKey(name: 'follow_me')
	bool followMe;

	@JsonKey(name: 'following')
	bool following;

	@JsonKey(name: 'followers_count')
	int followersCount;

	@JsonKey(name: 'follow_count')
	int followCount;

	@JsonKey(name: 'cover_image_phone')
	String coverImagePhone;

	@JsonKey(name: 'avatar_hd')
	String avatarHd;

	@JsonKey(name: 'like')
	bool like;

	@JsonKey(name: 'like_me')
	bool likeMe;

	@JsonKey(name: 'bedge')
	ModelSearchBedge bedge;

	ModelSearchUser({
		this.id,
		this.screenName,
		this.profileImageUrl,
		this.profileUrl,
		this.statusesCount,
		this.verified,
		this.verifiedType,
		this.closeBlueV,
		this.description,
		this.gender,
		this.mbtype,
		this.urank,
		this.mbrank,
		this.followMe,
		this.following,
		this.followersCount,
		this.followCount,
		this.coverImagePhone,
		this.avatarHd,
		this.like,
		this.likeMe,
		this.bedge
	});

	factory ModelSearchUser.fromJson(Map<String, dynamic> srcJson) => _$ModelSearchUserFromJson(srcJson);

	Map<String, dynamic> toJson() => _$ModelSearchUserToJson(this);

}

  
