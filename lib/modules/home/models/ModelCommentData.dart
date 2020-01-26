import 'dart:convert';

import 'package:flutter_travel/modules/common/CommonGalleryItem.dart';

/// 留言列表数据
class ModelCommentData {

	List<ModelComments> comments = [];
	List<ModelComments> vipComments = [];
	List<ModelComments> hotComments = [];

	/// 更新数据源
	void update(dynamic resultData) {
		dynamic resulDataStr = resultData.data;
		dynamic result = json.decode(resulDataStr);
		var errmsg = result['errno'];

		if (result != null && errmsg == 0) {
			dynamic resultData = result['data'];

			if (resultData is List) {
				return;
			}
			dynamic comments = resultData['comments'];
			dynamic vipComments = resultData['vip_comments'];
			dynamic hotComments = resultData['hot_comments'];
			
			if (vipComments != null) {
				for(Map item in vipComments) {
					ModelComments itemData = new ModelComments();
					itemData.update(item);
					this.vipComments.add(itemData);
				}
			}
			
			if (hotComments != null) {
				for(Map item in hotComments) {
					ModelComments itemData = new ModelComments();
					itemData.update(item);
					this.hotComments.add(itemData);
				}
			}
			
			if (comments != null) {
				for(Map item in comments) {
					ModelComments itemData = new ModelComments();
					itemData.update(item);
					this.comments.add(itemData);
				}
			}
		}
	}
}

class ModelComments {
	String userName;
	String userPic;
	String userType;
	String supportCount;
	int ts;
	String id;
	String text;
	String from;	
	String replyUserName;
	String isReply;
	List<CommonGalleryItem> thumbList = [];

	/// 更新数据源
	void update(dynamic resultData) {
		if (resultData == null) {
			return;
		}

		this.userName = resultData['user_name'];
		this.userPic = resultData['user_pic'];
		this.userType = resultData['user_type'];
		this.supportCount = resultData['support_count'];
		this.ts = resultData['ts'];
		this.id = resultData['id'];
		this.text = resultData['text'];
		this.from = resultData['from'];		
		this.replyUserName = resultData['reply_user_name'];	
		this.isReply = resultData['is_reply'];
	}
}