import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
    TypedReducer<AuthState, UserLoginRequest>(userLoginRequestReducer),
    TypedReducer<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
    TypedReducer<AuthState, UserLoginFailure>(userLoginFailureReducer),
    TypedReducer<AuthState, UserLogout>(userLogoutReducer),
]);

AuthState userLoginRequestReducer(AuthState auth, UserLoginRequest action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: true,
    );
}

AuthState userLoginSuccessReducer(AuthState auth, UserLoginSuccess action) {
    return auth.copyWith(
        isAuthenticated: true,
        isAuthenticating: false,
        user: action.user
    );
}

AuthState userLoginFailureReducer(AuthState auth, UserLoginFailure action) {
    return auth.copyWith(
        isAuthenticated: false,
        isAuthenticating: false,
        error: action.error
    );
}

AuthState userLogoutReducer(AuthState auth, UserLogout action) {
    return AuthState();
}