import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/api/ApiLibInfo.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// libinfo服务
class ServiceLibInfo extends HttpServiceCore {
	factory ServiceLibInfo() => _getInstance();
	static ServiceLibInfo get instance => _getInstance();
	static ServiceLibInfo _instance;
	static ServiceLibInfo _getInstance() {
		if (_instance == null) {
			_instance = new ServiceLibInfo._internal();
		}

		return _instance;
	}

	/// 步长
	int pn = 0;

	ServiceLibInfo._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.MOBILE_BAIDU;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 获取步长值
	int getPnCode() {
		return this.pn += 10;
	}

	/// get libid
	Future<Response<dynamic>> getLibInfo(String searchContent) async {
		dynamic result;
		ApiLibInfo sourceLibInfp = this.enviroment.getEnv().getLibInfo();
		if (sourceLibInfp == null) {
			dynamic requestData = {
				'pd': 'realtime',
				'atn': 'index',
				'tn': 'vsearch',
				'sa': 'tb',
				'oq': searchContent,
				'word': searchContent,
				'vs_req_t': new DateTime.now().millisecondsSinceEpoch
			};
			result = await this.get('sf/vsearch', queryParameters: requestData);
			Headers headers = result.headers;
			ApiLibInfo libInfo = new ApiLibInfo();
			libInfo.update(headers.map);

			this.enviroment.getEnv().updateLibInfo(libInfo);

			return result;
		}

		return null;
	}

	/// 搜索内容
	/// https://m.baidu.com/sf/vsearch?word=%E4%BD%9F%E4%B8%BD%E4%BA%9A&pd=realtime&tn=vsearch&pn=30&sa=vs_tab&mod=5&p_type=1&data_type=json&atn=index&lid=7641069990832771771
	Future<Response<dynamic>> getSearchContent(String searchContent) async {
		dynamic requestData = {
			'word': searchContent,
			'pd': 'realtime',
			'tn': 'vsearch',
			'pn': this.getPnCode(),
			'sa': 'vs_tab',
			'mod': 5,
			'p_type': 1,
			'data_type': 'json',
			'atn': 'index',
			'lid': this.enviroment.getEnv().getLibInfo().libId
		};

		return await this.get('sf/vsearch', queryParameters: requestData);
	}
}
