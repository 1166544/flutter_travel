import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCommentCount.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCommentData.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';

/// 详情页数据结构
class CirclerModelPageData {
	CirclerModelDetail detailInfo;
	CirclerModelCommentCount commentInfo;
	CirclerModelCommentData commentListData;

	void update(CirclerModelDetail detailInfo, CirclerModelCommentCount commentInfo, CirclerModelCommentData commentListData) {
		this.detailInfo = detailInfo;
		this.commentInfo = commentInfo;
		this.commentListData = commentListData;
	}
}