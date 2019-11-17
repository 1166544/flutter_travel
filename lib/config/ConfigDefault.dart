import 'package:flutter_travel/core/api/ApiConfigVO.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';

/// 默认配置
class ConfigDefault {

	/// 调用服务器API列表配置
	List<ApiConfigVO> serverUrlList = [];

	ConfigDefault() {
		/// 服务器默认URL配置(各环境在构造函数中重写)
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
			key: API_ENUM.BAIDU,
			serverUrl: 'https://news.baidu.com/'
		));
	}

	/// 获取服务器URL
	String getServerUrl(API_ENUM enumName) {
		String serverUrl = '';
		this.serverUrlList.forEach((ApiConfigVO value) {
			if (value.key == enumName) {
				serverUrl = value.serverUrl;
			}
		});

		return serverUrl;
	}

	/// proxy服务器地址，默认不走proxy
	String getProxyUrl() {
		return '';
	}

}
