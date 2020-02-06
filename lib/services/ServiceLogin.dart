import 'package:flutter_github_api/entity/basic_auth_param.dart';
import 'package:flutter_github_api/entity/oauth_result.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

/// 登录服务
class ServiceLogin extends HttpServiceCore {
	factory ServiceLogin() => _getInstance();
	static ServiceLogin get instance => _getInstance();
	static ServiceLogin _instance;
	static ServiceLogin _getInstance() {
		if (_instance == null) {
			_instance = new ServiceLogin._internal();
		}

		return _instance;
	}

	Auth auth;
	GithubOauth oauth;

	ServiceLogin._internal(): super() {
		// 初始化
		this.enviroment = ManagerEnviroment.instance;

		this.auth = Auth(
			this.enviroment.getEnv().githubAppClientId(), 
			this.enviroment.getEnv().githubAppClientSecret()
		);
		this.oauth = GithubOauth(auth);

		super.init();
	}

	/// get github token
	Future<OauthResult<User>> getAuthInfo(String userName, String password) async {
		return this.oauth.login(userName, password);
	}

	/// get github login info
	Future<OauthResult<String>> getToken(String userName, String password) async {
		return this.oauth.getToken(userName, password);
	}
}
