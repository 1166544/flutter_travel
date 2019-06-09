/// 消息通知数据格式
class NoticePageVO {
	NoticePageVO({this.subTitle, this.description, this.isReaded = false});

	/// 子标题
	String subTitle;

	/// 描述
	String description;

	/// 是否已读
	bool isReaded;

}
