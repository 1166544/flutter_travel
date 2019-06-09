import 'package:flutter_travel/pages/modules/notices/NoticePageVO.dart';

/// 展示用消息体
class NoticeReadVO {
    // 构造体
	NoticeReadVO({this.dateTitle, this.readList});

	/// 日期标题
	String dateTitle;

	/// 标题列表
	List<NoticePageVO> readList;
}
