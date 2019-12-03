import 'package:flutter_travel/models/ModelAuthState.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
    final AuthState auth;

    AppState({AuthState auth}):
        auth = auth ?? AuthState();

    static AppState rehydrationJSON(dynamic json) => AppState(
        auth: AuthState.fromJSON(json['auth'])
    );

    Map<String, dynamic> toJson() => {
        'auth': auth.toJSON()
    };

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