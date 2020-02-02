import 'package:flutter_github_api/flutter_github_api.dart';

/// 用户信息
class StateUser {
    String token;
    String id;
	final User user;

    StateUser(this.user, this.token);

    Map<String, dynamic> toJSON() => <String, dynamic>{
        'token': this.token,
        'id': this.id
    };

    factory StateUser.fromJSON(Map<String, dynamic> json) => StateUser(
        json['token'],
        json['id'],
    );

    @override
    String toString() {
        return '{token: $token, id: $id}';
    }
}