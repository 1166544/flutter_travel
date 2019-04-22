/// 消息通知数据格式
class PageNoticeVO {
	PageNoticeVO({this.subTitle, this.description, this.isReaded = false});

	String subTitle;
	String description;
	bool isReaded;

}
