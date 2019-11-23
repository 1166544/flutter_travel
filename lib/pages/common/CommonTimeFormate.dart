/// 格式化时间组件
class CommonTimeFormate {

	/// 返回时间截 2019/11/22 格式
	String getDateText(String dateNum) {
		var dateNo = int.parse(dateNum);
		var date = new DateTime.fromMillisecondsSinceEpoch(dateNo);
		var dateStr = date.year.toString() + '/' + date.month.toString() + '/' + date.day.toString();

		return dateStr;
	}

	/// 返回年月日 时分秒格式 2019/11/22 22:22
	String getFullTime(String dateNum) {
		var dateNo = int.parse(dateNum);
		var date = new DateTime.fromMillisecondsSinceEpoch(dateNo);
		var dateStr = date.year.toString() + '年' + date.month.toString() + '月' + date.day.toString() + '日 ' + date.hour.toString() + ':' + date.minute.toString();

		return dateStr;
	}
}