import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';
import 'package:redux/redux.dart';

/// 合并Reducer
Reducer<StateAuth> authReducer = combineReducers([
    TypedReducer<StateAuth, UserLoginRequest>(userLoginRequestReducer),
    TypedReducer<StateAuth, UserLoginSuccess>(userLoginSuccessReducer),
    TypedReducer<StateAuth, UserLoginFailure>(userLoginFailureReducer),
    TypedReducer<StateAuth, UserLogout>(userLogoutReducer),
]);

/// 用户登录请求Reducer
StateAuth userLoginRequestReducer(StateAuth auth, UserLoginRequest action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: true,
    );
}

/// 用户登录成功Reducer
StateAuth userLoginSuccessReducer(StateAuth auth, UserLoginSuccess action) {
    return auth.copyWith(
        isAuthenticated: true,
        isAuthenticating: false,
        user: action.user
    );
}

/// 用户登录失败Reducer
StateAuth userLoginFailureReducer(StateAuth auth, UserLoginFailure action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: false,
        error: action.error,
		user: action.user
    );
}

/// 用户退出登录Reducer
StateAuth userLogoutReducer(StateAuth auth, UserLogout action) {
    return StateAuth();
}