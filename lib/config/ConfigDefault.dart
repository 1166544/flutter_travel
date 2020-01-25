import 'package:flutter_travel/core/api/ApiConfigVO.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/api/ApiLibInfo.dart';
import 'package:flutter_travel/core/api/ApiToken.dart';

/// 默认配置
class ConfigDefault {

	/// 调用服务器API列表配置
	List<ApiConfigVO> serverUrlList = [];
	ApiToken _apiToken;
	ApiLibInfo _apiLibInfo;

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

	/// 更新TOKEN
	void updateToken(ApiToken val) {
		this._apiToken = val;
	}

	/// 更新LIBINFO
	void updateLibInfo(ApiLibInfo val) {
		this._apiLibInfo = val;
	}

	/// token
	ApiToken getToken() {
		return this._apiToken;
	}

	/// libid
	ApiLibInfo getLibInfo() {
		return this._apiLibInfo;
	}

}
