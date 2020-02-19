import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/core/api/ApiConfigVO.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';

/// 重写测试环境配置
class ConfigTest extends ConfigDefault {

	ConfigTest(): super() {
		// 测试服务器URL配置
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
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.BING,
			serverUrl: 'https://cn.bing.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.OPEN_WEATHER,
			serverUrl: 'https://api.openweathermap.org/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.FREE_API,
			serverUrl: 'https://free-api.heweather.net/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.GITHUB,
			serverUrl: 'https://api.github.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.NOW,
			serverUrl: 'https://github-contributions-api.now.sh/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.WEIBO,
			serverUrl: 'https://m.weibo.cn/'
		));
	}

}
