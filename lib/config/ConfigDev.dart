import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/core/api/ApiConfigVO.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';

/// 重写开发环境配置
class ConfigDev extends ConfigDefault {

	ConfigDev(): super() {
		// 开发服服务器URL配置
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.API_OPEN,
			serverUrl: 'https://www.apiopen.top/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.TENCENT,
			serverUrl: 'https://www.qq.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.JSON_PLACE_HOLDER,
			serverUrl: 'https://jsonplaceholder.typicode.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.CN_NODE,
			serverUrl: 'https://cnodejs.org/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.NEWS_BAIDU,
			serverUrl: 'https://news.baidu.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.MOBILE_BAIDU,
			serverUrl: 'https://m.baidu.com/'
		));
	}

	/// proxy服务器地址，只有开发环境走proxy
	String getProxyUrl() {
		return '127.0.0.1:8888';
	}

}
