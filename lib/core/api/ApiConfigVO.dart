import 'package:flutter_travel/core/api/ApiEnum.dart';

/// URL数据源结构
class ApiConfigVO {
	/// URL KEY
	API_ENUM key;

	/// URL地址
	String serverUrl;

	ApiConfigVO({this.key, this.serverUrl});
}
