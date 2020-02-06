import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

/// Bing API服务
class ServiceBing extends HttpServiceCore {
	factory ServiceBing() => _getInstance();
	static ServiceBing get instance => _getInstance();
	static ServiceBing _instance;
	static ServiceBing _getInstance() {
		if (_instance == null) {
			_instance = new ServiceBing._internal();
		}

		return _instance;
	}

	ServiceBing._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.BING;
		this.enviroment = ManagerEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 重写生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'Cache-Control': 'no-cache',
			'Accept': '*/*',
			'Host': 'cn.bing.com',
			'Accept-Encoding': 'gzip, deflate',
			'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36'
		};
	}

	/// 封顶图片
	/// form 格式
	/// url https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&nc=1579939952028&pid=hp&uhd=1&uhdwidth=3840&uhdheight=2160
	Future<Response<dynamic>> getSplashImage(dynamic params) async {
		Response response = await this.get('HPImageArchive.aspx?format=js&idx=0&n=1&nc=${new DateTime.now().millisecondsSinceEpoch}&pid=hp&uhd=1&uhdwidth=3840&uhdheight=2160');
		return response;
	}
}
