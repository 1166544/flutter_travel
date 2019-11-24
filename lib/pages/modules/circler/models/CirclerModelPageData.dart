import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCommentCount.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';

/// 详情页数据结构
class CirclerModelPageData {
	CirclerModelDetail detailInfo;
	CirclerModelCommentCount commentInfo;

	void update(CirclerModelDetail detailInfo, CirclerModelCommentCount commentInfo) {
		this.detailInfo = detailInfo;
		this.commentInfo = commentInfo;
	}
}