import 'package:dio/dio.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
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
	User user;
	ConfigDefault config;

	ServiceGitHub._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.GITHUB;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
		this.store = ServiceGlobal.instance.getStoreInstance();
		this.user = this.store.state.auth.user.user;
		this.config = this.enviroment.getEnv();
	}

	/// 重写生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
		};
	}

	/// get github userinfo
	Future<Response<dynamic>> getUserInfo() async {
		var result = await this.get('users/${this.user.name}');
		String tocken = this.store.state.auth.user.token;
		store.dispatch(UserLoginSuccess(StateUser(User.fromJson(result.data), tocken)));

		return result;
	}

	/// 获取个人所有repo
	Future<Response<dynamic>> getAllRepo() async {
		return await this.get('users/${this.user.name}/repos');
	}

	/// 获取repo详细信息
	Future<Response<dynamic>> getRepoDetail(String repoName) async {
		return await this.get('repos/${this.user.name}/$repoName');
	}

	/// 获取某个repo的内容列表
	Future<Response<dynamic>> getRepoCotentList(String repoName) async {
		return await this.get('repos/${this.user.name}/$repoName/contents');
	}

	/// 获取repo中子目录的内容列表
	Future<Response<dynamic>> getRepoDirContentList(String repoName, String dirName) async {
		return await this.get('repos/${this.user.name}/$repoName/contents/$dirName');
	}

	/// 获取repo中某文件信息（不包括内容）
	Future<Response<dynamic>> getRepoFileInfo(String repoName, String filePath) async {
		return await this.get('repos/${this.user.name}/$repoName/contents/$filePath');
	}

	/// 获取某文件的原始内容（Raw）
	Future<Response<dynamic>> getRepoFileContent(String repoName, String branchName, String filePath) async {
		return this.get('${this.user.name}/$repoName/$branchName/$filePath');
	}
}
