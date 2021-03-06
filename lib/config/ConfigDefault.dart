import 'package:flutter_travel/core/api/ApiConfigVO.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/api/ApiLibInfo.dart';
import 'package:flutter_travel/core/api/ApiToken.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchPage.dart';

/// 默认配置
class ConfigDefault {

	/// 调用服务器API列表配置
	List<ApiConfigVO> serverUrlList = [];
	ApiToken _apiToken;
	ApiLibInfo _apiLibInfo;
	ModelSearchPage _ticketData;
	
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
		return null;
	}

	/// 更新TOKEN
	void updateToken(ApiToken val) {
		this._apiToken = val;
	}

	/// 更新ticket
	void updateTicket(ModelSearchPage ticketData) {
		this._ticketData = ticketData;
	}

	/// 更新LIBINFO
	void updateLibInfo(ApiLibInfo val) {
		this._apiLibInfo = val;
	}

	ModelSearchPage getTicket() {
		return this._ticketData;
	}

	/// token
	ApiToken getToken() {
		return this._apiToken;
	}

	/// libid
	ApiLibInfo getLibInfo() {
		return this._apiLibInfo;
	}

	/// open weather key
	String openWeatherKey() {
		return '2f8796eefe67558dc205b09dd336d022';
	}

	/// heweahter key
	String heWeatherKey() {
		return '2d2a76fac8324146a1b17b68bda42c76';
	}

	/// github auth client id
	String githubAppClientId() {
		return '76edfa3197b5ddb963b1';
	}

	/// github App ClientSecret
	String githubAppClientSecret() {
		return '9a1eae61d39f7d4551700dfe91224893a49db0e9';
	}

	/// login logo url
	String loginLogoUrl() {
		return 'https://github.githubassets.com/images/modules/octocats/supportcat.jpg';
	}

	/// 上报EMAIL地址
	List<String> getSendReportEmail() {
		return [
			'1166544@qq.com'
		];
	}
}
