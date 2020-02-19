import 'package:flutter_travel/modules/search/models/model-container/ModelSearchButtons.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchMblogButtons.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchNumberDisplayStrategy.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchPics.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchUser.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchVisible.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModelSearchMblog.g.dart';

@JsonSerializable()
class ModelSearchMblog {
    @JsonKey(name: 'visible')
    ModelSearchVisible visible;

    @JsonKey(name: 'created_at')
    String createdAt;

    @JsonKey(name: 'id')
    String id;

    @JsonKey(name: 'idstr')
    String idstr;

    @JsonKey(name: 'mid')
    String mid;

    @JsonKey(name: 'can_edit')
    bool canEdit;

    @JsonKey(name: 'show_additional_indication')
    int showAdditionalIndication;

    @JsonKey(name: 'text')
    String text;

    @JsonKey(name: 'textLength')
    int textLength;

    @JsonKey(name: 'source')
    String source;

    @JsonKey(name: 'favorited')
    bool favorited;

    @JsonKey(name: 'pic_types')
    String picTypes;

    @JsonKey(name: 'thumbnail_pic')
    String thumbnailPic;

    @JsonKey(name: 'bmiddle_pic')
    String bmiddlePic;

    @JsonKey(name: 'original_pic')
    String originalPic;

    @JsonKey(name: 'is_paid')
    bool isPaid;

    @JsonKey(name: 'mblog_vip_type')
    int mblogVipType;

    @JsonKey(name: 'user')
    ModelSearchUser user;

    @JsonKey(name: 'reposts_count')
    int repostsCount;

    @JsonKey(name: 'comments_count')
    int commentsCount;

    @JsonKey(name: 'attitudes_count')
    int attitudesCount;

    @JsonKey(name: 'pending_approval_count')
    int pendingApprovalCount;

    @JsonKey(name: 'isLongText')
    bool isLongText;

    @JsonKey(name: 'reward_exhibition_type')
    int rewardExhibitionType;

    @JsonKey(name: 'reward_scheme')
    String rewardScheme;

    @JsonKey(name: 'hide_flag')
    int hideFlag;

    @JsonKey(name: 'mlevel')
    int mlevel;

    @JsonKey(name: 'mblogtype')
    int mblogtype;

    @JsonKey(name: 'rid')
    String rid;

    @JsonKey(name: 'more_info_type')
    int moreInfoType;

    @JsonKey(name: 'cardid')
    String cardid;

    @JsonKey(name: 'extern_safe')
    int externSafe;

	@JsonKey(name: 'number_display_strategy')
	ModelSearchNumberDisplayStrategy numberDisplayStrategy;

	@JsonKey(name: 'content_auth')
	int contentAuth;

	@JsonKey(name: 'pic_num')
	int picNum;

	@JsonKey(name: 'weibo_position')
	int weiboPosition;

	@JsonKey(name: 'show_attitude_bar')
	int showAttitudeBar;

	@JsonKey(name: 'buttons')
	List<ModelSearchButtons> buttons;

	@JsonKey(name: 'from_cateid')
	String fromCateid;

	@JsonKey(name: 'recommend_source')
	int recommendSource;

	@JsonKey(name: 'bid')
	String bid;

	@JsonKey(name: 'mblog_buttons')
	List<ModelSearchMblogButtons> mblogButtons;

	@JsonKey(name: 'pics')
	List<ModelSearchPics> pics;

    ModelSearchMblog({
        this.visible,
		this.createdAt,
		this.id,
		this.idstr,
		this.mid,
		this.canEdit,
		this.showAdditionalIndication,
		this.text,
		this.textLength,
		this.source,
		this.favorited,
		this.picTypes,
		this.thumbnailPic,
		this.bmiddlePic,
		this.originalPic,
		this.isPaid,
		this.mblogVipType,
		this.user,
		this.repostsCount,
		this.commentsCount,
		this.attitudesCount,
		this.pendingApprovalCount,
		this.isLongText,
		this.rewardExhibitionType,
		this.rewardScheme,
		this.hideFlag,
		this.mlevel,
		this.mblogtype,
		this.rid,
		this.moreInfoType,
		this.cardid,
		this.externSafe,
		this.numberDisplayStrategy,
		this.contentAuth,
		this.picNum,
		this.weiboPosition,
		this.showAttitudeBar,
		this.buttons,
		this.fromCateid,
		this.recommendSource,
		this.mblogButtons,
		this.bid,
		this.pics
    });

    factory ModelSearchMblog.fromJson(Map<String, dynamic> json) => _$ModelSearchMblogFromJson(json);
    Map<String, dynamic> toJson() => _$ModelSearchMblogToJson(this);
}