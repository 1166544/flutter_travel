import 'package:flutter/material.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:redux/redux.dart';

class UserLoginRequest {}

class UserLoginSuccess {
    final User user;

    UserLoginSuccess(this.user);
}

class UserLoginFailure {
    final String error;

    UserLoginFailure(this.error);
}

class UserLogout {}

final Function login = (BuildContext context, String username, String password) {
    return (Store<AppState> store) {
        store.dispatch(UserLoginRequest());
        if (username == 'james' && password == 'liauw') {
            store.dispatch(UserLoginSuccess(User('placeholder_token', 'placeholder_id')));
            Navigator.of(context).pushNamedAndRemoveUntil('/main', (_) => false);
        } else {
            store.dispatch(UserLoginFailure('Username or password were incorrect.'));
        }
    };
};

final Function logout = (BuildContext context) {
    return (Store<AppState> store) {
        store.dispatch(UserLogout());
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
    };
};