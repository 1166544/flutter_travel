import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';
import 'package:redux/redux.dart';

/// 合并Reducer
Reducer<AuthState> authReducer = combineReducers([
    TypedReducer<AuthState, UserLoginRequest>(userLoginRequestReducer),
    TypedReducer<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
    TypedReducer<AuthState, UserLoginFailure>(userLoginFailureReducer),
    TypedReducer<AuthState, UserLogout>(userLogoutReducer),
]);

/// 用户登录请求Reducer
AuthState userLoginRequestReducer(AuthState auth, UserLoginRequest action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: true,
    );
}

/// 用户登录成功Reducer
AuthState userLoginSuccessReducer(AuthState auth, UserLoginSuccess action) {
    return auth.copyWith(
        isAuthenticated: true,
        isAuthenticating: false,
        user: action.user
    );
}

/// 用户登录失败Reducer
AuthState userLoginFailureReducer(AuthState auth, UserLoginFailure action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: false,
        error: action.error,
		user: action.user
    );
}

/// 用户退出登录Reducer
AuthState userLogoutReducer(AuthState auth, UserLogout action) {
    return AuthState();
}