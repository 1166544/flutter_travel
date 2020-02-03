import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/services/ServiceGlobal.dart';
import 'package:redux/redux.dart';

import 'ServiceEnviroment.dart';

/// now.sh服务
class ServiceNow extends HttpServiceCore {
	factory ServiceNow() => _getInstance();
	static ServiceNow get instance => _getInstance();
	static ServiceNow _instance;
	static ServiceNow _getInstance() {
		if (_instance == null) {
			_instance = new ServiceNow._internal();
		}

		return _instance;
	}

	/// STORE
	Store<AppState> store;

	ServiceNow._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.NOW;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
		this.store = ServiceGlobal.instance.getStoreInstance();
	}

	/// get github contributions
	Future<Response<dynamic>> getContributions() async {
		return await this.get('v1/${this.store.state.auth.user.user.name}?format=nested&v=1');
	}
}
