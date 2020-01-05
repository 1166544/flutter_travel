import 'package:flutter_travel/redux/states/StateUser.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState {

    /// 是否已登录
    final bool isAuthenticated;

	/// 登录认证中
    final bool isAuthenticating;

	/// 用户信息
    final User user;

	/// 错误信息
    final String error;

    // constructor with default
    AuthState({
        this.isAuthenticated = false,
        this.isAuthenticating = false,
        this.user,
        this.error,
    });

    // 返回副本,允许复制之前的AuthState参数时修改这些参数
    AuthState copyWith({
        bool isAuthenticated,
        bool isAuthenticating,
        String error,
        User user
    }) {
        return AuthState(
            isAuthenticated: isAuthenticated ?? this.isAuthenticated,
            isAuthenticating: isAuthenticating ?? this.isAuthenticating,
            error: error ?? this.error,
            user: user ?? this.user,
        );
    }

	/// JSON反序列化
    factory AuthState.fromJSON(Map<String, dynamic> json) => AuthState(
        isAuthenticated: json['isAuthenticated'],
        isAuthenticating: json['isAuthenticating'],
        error: '',	// 反系列化时上次记录的登录错误信息不需要记录
        user: json['user'] == null ? null : User.fromJSON(json['user']),
    );

	/// 转换成JSON
    Map<String, dynamic> toJSON() => <String, dynamic>{
        'isAuthenticated': this.isAuthenticated,
        'isAuthenticating': this.isAuthenticating,
        'user': this.user == null ? null : this.user.toJSON(),
        'error': '', // 系列化时上次记录的登录错误信息不需要记录
    };

    @override
    String toString() {
        return '''{
                isAuthenticated: $isAuthenticated,
                isAuthenticating: $isAuthenticating,
                user: $user,
                error: $error
            }''';
    }
}