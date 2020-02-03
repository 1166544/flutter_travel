import 'package:dio/dio.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:flutter_travel/services/ServiceGlobal.dart';
import 'package:redux/redux.dart';

import 'ServiceEnviroment.dart';

/// Github服务
class ServiceGitHub extends HttpServiceCore {
	factory ServiceGitHub() => _getInstance();
	static ServiceGitHub get instance => _getInstance();
	static ServiceGitHub _instance;
	static ServiceGitHub _getInstance() {
		if (_instance == null) {
			_instance = new ServiceGitHub._internal();
		}

		return _instance;
	}

	/// STORE
	Store<AppState> store;

	ServiceGitHub._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.GITHUB;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
		this.store = ServiceGlobal.instance.getStoreInstance();
	}

	/// 重写生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
		};
	}

	/// get github userinfo
	Future<Response<dynamic>> getUserInfo() async {
		var result = await this.get('users/${this.store.state.auth.user.user.name}?client_id=${this.enviroment.getEnv().githubAppClientId()}&client_secret=${this.enviroment.getEnv().githubAppClientSecret()}');
		String tocken = this.store.state.auth.user.token;
		store.dispatch(UserLoginSuccess(StateUser(User.fromJson(result.data), tocken)));

		return result;
	}
}
