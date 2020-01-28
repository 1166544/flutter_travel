import 'package:flutter/material.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:flutter_travel/routers/Routers.dart';
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
final Function login = (BuildContext context, String username, String password) {
    return (Store<AppState> store) {
        store.dispatch(UserLoginRequest());

		// 模拟登录
        if (username == 'james' && password == 'liauw') {
            store.dispatch(UserLoginSuccess(StateUser('placeholder_token', 'placeholder_id')));
            Navigator.of(context).pushNamedAndRemoveUntil(Routers.mainPage, (_) => false);
        } else {
            store.dispatch(UserLoginFailure('Username or password were incorrect.', StateUser('', '')));
        }
    };
};

/// 清除上次输入内容
final Function clear = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLoginFailure('', StateUser('', '')));
    };
};

/// 封装退出
final Function logout = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLogout());
        Navigator.of(context).pushNamedAndRemoveUntil(Routers.loginPage, (_) => false);
    };
};