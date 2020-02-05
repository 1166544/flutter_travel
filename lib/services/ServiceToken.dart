import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/api/ApiToken.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// TOKEN服务
class ServiceToken extends HttpServiceCore {
	factory ServiceToken() => _getInstance();
	static ServiceToken get instance => _getInstance();
	static ServiceToken _instance;
	static ServiceToken _getInstance() {
		if (_instance == null) {
			_instance = new ServiceToken._internal();
		}

		return _instance;
	}

	ServiceToken._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.NEWS_BAIDU;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 重写生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3',
			'Accept-Encoding': 'gzip, deflate, br',
			'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
			'Cache-Control': 'max-age=0',
			'Connection': 'keep-alive',
			'Host': 'news.baidu.com',
			'If-Modified-Since': 'Wed, 17 Jul 2019 09:51:50 GMT',
			'Sec-Fetch-Mode': 'navigate',
			'Sec-Fetch-Site': 'none',
			'Sec-Fetch-User': '?1',
			'Upgrade-Insecure-Requests': '1',
			'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
		};
	}

	/// get news token
	Future<Response<dynamic>> getToken() async {
		dynamic result;
		ApiToken sourceToken = this.enviroment.getEnv().getToken();
		if (sourceToken == null || sourceToken.checkIsExpire()) {
			result = await this.get('news');
			Headers headers = result.headers;
			ApiToken apiToken = new ApiToken();
			apiToken.update(headers.map);

			this.enviroment.getEnv().updateToken(apiToken);

			return result;
		}

		return null;
	}

	/// 将TOKEN重置过期
	void resetToken() {
		ApiToken sourceToken = this.enviroment.getEnv().getToken();
		sourceToken.updateExpire(true);
	}
}
