import 'package:flutter_travel/redux/states/StateAuth.dart';
import 'package:flutter_travel/redux/states/StatePage.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
    final AuthState auth;
	final StatePage page;

    AppState({AuthState auth, StatePage page}): 
		auth = auth ?? AuthState(), 
		page = page ?? StatePage();

	/// 将登录信息从本地缓存反序列化
    static AppState rehydrationJSON(dynamic json) => AppState(
        auth: AuthState.fromJSON(json['auth'])
    );

	/// 登录信息转成JSON结构
    Map<String, dynamic> toJson() => {
        'auth': auth.toJSON()
    };

	/// 返回副本
    AppState copyWith({
        bool rehydrated,
        AuthState auth,
    }) {
        return AppState(
            auth: auth ?? this.auth
        );
    }

    @override
    String toString() {
        return '''AppState{
            auth: $auth,
        }''';
    }
}