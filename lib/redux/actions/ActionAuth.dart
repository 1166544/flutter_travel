import 'package:flutter/material.dart';
import 'package:flutter_github_api/entity/oauth_result.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:flutter_travel/routers/Routers.dart';
import 'package:flutter_travel/services/ServiceLogin.dart';
import 'package:redux/redux.dart';

/// 用户登录请求
class UserLoginRequest {}

/// 用户登录成功
class UserLoginSuccess {
    final StateUser user;

    UserLoginSuccess(this.user);
}

/// 用登录失败
class UserLoginFailure {
    final String error;
	final StateUser user;

    UserLoginFailure(this.error, this.user);
}

/// 用户退出
class UserLogout {}

/// 封装登录
final Function login = (BuildContext context, String userName, String password) {
    return (Store<AppState> store) async {
        store.dispatch(UserLoginRequest());

		ServiceLogin serviceLogin = ServiceLogin();
		OauthResult<User> loginInfo = await serviceLogin.getAuthInfo(userName, password);
		OauthResult<String> tokenInfo = await serviceLogin.getToken(userName, password);
		
		if (loginInfo.data != null) {
			store.dispatch(UserLoginSuccess(StateUser(loginInfo.data, tokenInfo.data)));
			Navigator.of(context).pushNamedAndRemoveUntil(Routers.mainPage, (_) => false);
		} else {
			store.dispatch(UserLoginFailure('Username or password were incorrect.', StateUser(null, '')));
		}
		
		// Auth auth = Auth(ServiceEnviroment.instance.getEnv().githubAppClientId(), ServiceEnviroment.instance.getEnv().githubAppClientSecret());
		// GithubOauth oauth = GithubOauth(auth);
		// oauth.login(username,password).then((result){
		// 	if (result.data != null) {
		// 		oauth.getToken(username, password).then((tokenValue) {
		// 			store.dispatch(UserLoginSuccess(StateUser(result.data, tokenValue.data)));
		// 			Navigator.of(context).pushNamedAndRemoveUntil(Routers.mainPage, (_) => false);
		// 		});
		// 	} else {
		// 		store.dispatch(UserLoginFailure('Username or password were incorrect.', StateUser(null, '')));
		// 	}
		// });

    };
};

/// 清除上次输入内容
final Function clear = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLoginFailure('', StateUser(null, '')));
    };
};

/// 封装退出
final Function logout = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLogout());
        Navigator.of(context).pushNamedAndRemoveUntil(Routers.loginPage, (_) => false);
    };
};