import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// 中文版天气和空气质量 API服务
class ServiceFreeAirAndWeather extends HttpServiceCore {
	String openKey;
	factory ServiceFreeAirAndWeather() => _getInstance();
	static ServiceFreeAirAndWeather get instance => _getInstance();
	static ServiceFreeAirAndWeather _instance;
	static ServiceFreeAirAndWeather _getInstance() {
		if (_instance == null) {
			_instance = new ServiceFreeAirAndWeather._internal();
		}

		return _instance;
	}

	ServiceFreeAirAndWeather._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.FREE_API;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);
		this.openKey = this.enviroment.getEnv().heWeatherKey();

		super.init();
	}

	/// 重写生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'Cache-Control': 'no-cache',
			'Accept': '*/*',
			'Accept-Encoding': 'gzip, deflate, br',
			'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36'
		};
	}

	/// 依据城市返回天气信息
	/// url https://free-api.heweather.net/s6/weather?key=&location=Guanghou
	Future<Response<dynamic>> getWeatherInfoByName({String location}) async {
		return await this.get('s6/weather?key=${this.openKey}&location=${location.toString()}');
	}

	/// 依据城市返回空气质量信息
	/// url https://free-api.heweather.net/s6/weather?key=&location=Guanghou
	Future<Response<dynamic>> getAirInfoByName({String location}) async {
		return await this.get('s6/air/now?key=${this.openKey}&location=${location.toString()}');
	}
}
