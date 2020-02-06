import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

/// 通用天气 API服务
class ServiceOpenWeather extends HttpServiceCore {
	String openKey;
	factory ServiceOpenWeather() => _getInstance();
	static ServiceOpenWeather get instance => _getInstance();
	static ServiceOpenWeather _instance;
	static ServiceOpenWeather _getInstance() {
		if (_instance == null) {
			_instance = new ServiceOpenWeather._internal();
		}

		return _instance;
	}

	ServiceOpenWeather._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.OPEN_WEATHER;
		this.enviroment = ManagerEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);
		this.openKey = this.enviroment.getEnv().openWeatherKey();

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

	/// 依据经纬度返回城市信息
	/// url http://api.openweathermap.org/data/2.5/weather?lat=23.1290800000&lon=113.2643600000&appid=
	Future<Response<dynamic>> getCityNameByPosition({double lat, double lon}) async {
		return await this.get('data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=${this.openKey}');
	}
}
