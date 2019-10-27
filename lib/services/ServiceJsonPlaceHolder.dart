import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// JSON HOLDER API服务
class ServiceJsonPlaceHolder extends HttpServiceCore {
	factory ServiceJsonPlaceHolder() => _getInstance();
	static ServiceJsonPlaceHolder get instance => _getInstance();
	static ServiceJsonPlaceHolder _instance;
	static ServiceJsonPlaceHolder _getInstance() {
		if (_instance == null) {
			_instance = new ServiceJsonPlaceHolder._internal();
		}

		return _instance;
	}

	ServiceJsonPlaceHolder._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.JSON_PLACE_HOLDER;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 返回typecode列表
	/// url https://jsonplaceholder.typicode.com/posts
	Future<Response<dynamic>> getPostsData() async {
		return await this.get('posts');
	}

	/// 返回typecode详情
	/// url https://jsonplaceholder.typicode.com/posts/1
	/// * [int detailId] 详情ID
	Future<Response<dynamic>> getPostsDetailData(int detailId) async {
		return await this.get('posts/${detailId.toString()}');
	}
}
