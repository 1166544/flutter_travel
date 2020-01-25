import 'package:flutter_travel/modules/home/models/ModelCommentCount.dart';
import 'package:flutter_travel/modules/home/models/ModelCommentData.dart';
import 'package:flutter_travel/modules/home/models/ModelDetail.dart';

/// 详情页数据结构
class ModelPageData {
	ModelDetail detailInfo;
	ModelCommentCount commentInfo;
	ModelCommentData commentListData;

	void update(ModelDetail detailInfo, ModelCommentCount commentInfo, ModelCommentData commentListData) {
		this.detailInfo = detailInfo;
		this.commentInfo = commentInfo;
		this.commentListData = commentListData;
	}
}