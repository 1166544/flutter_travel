import 'package:flutter_travel/pages/notices/PageNoticeVO.dart';

/// 展示用消息体
class PageReadVO {
    // 构造体
	PageReadVO({this.dateTitle, this.readList});

	/// 日期标题
	String dateTitle;

	/// 标题列表
	List<PageNoticeVO> readList;
}
