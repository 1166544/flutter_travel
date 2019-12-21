/// 格式化时间组件
class CommonTimeFormate {

	/// 返回时间截 2019/11/22 格式
	String getDateText(dynamic dateNum) {
		var dateNo = int.parse(dateNum);
		var date = new DateTime.fromMillisecondsSinceEpoch(dateNo);
		var dateStr = date.year.toString() + '/' + date.month.toString() + '/' + date.day.toString();

		return dateStr;
	}

	/// (字符串传入) 返回年月日 时分秒格式 2019/11/22 22:22
	String getFullTime(String dateNum) {
		var dateNo = int.parse(dateNum);
		var date = new DateTime.fromMillisecondsSinceEpoch(dateNo);
		var month = date.month.toString();
		var day = date.day.toString();
		var hours = date.hour.toString();
		var minute = date.minute.toString();

		if (month.length == 1) {
			month = '0$month';
		}
		if (day.length == 1) {
			day = '0$day';
		}
		if (hours.length == 1) {
			hours = '0$hours';
		}
		if (minute.length == 1) {
			minute = '0$minute';
		}

		var dateStr = date.year.toString() + '年' + month + '月' + day + '日 ' + hours + ':' + minute;

		return dateStr;
	}
}