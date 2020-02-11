import 'package:flutter_travel/modules/utils/Utils.dart';

/// 格式化时间组件简化调用
class CommonTimeFormate {

	/// 返回时间截 2019/11/22 格式
	String getDateText(dynamic dateNum) {
		return Utils.getDateText(dateNum);
	}

	/// 返回当年年份时间
	String getNormalTime() {
		return Utils.getNormalTime();
	}

	/// (字符串传入) 返回年月日 时分秒格式 2019/11/22 22:22
	String getFullTime(String dateNum) {
		return Utils.getFullTime(dateNum);
	}
}