import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_travel/modules/splash/models/ModelsBing.dart';

/// 用户信息
class StateUser {
    final String token;
	final User user;
	ModelsBing coverData;

    StateUser(this.user, this.token);

    Map<String, dynamic> toJSON() => <String, dynamic>{
        'token': this.token,
		'user': this.user != null ? this.user.toJson() : ''
    };

	void updateCover(ModelsBing coverData) {
		this.coverData = coverData;
	}

    factory StateUser.fromJSON(Map<String, dynamic> json) => StateUser(
		User.fromJson(json['user']),
        json['token'],
    );

    @override
    String toString() {
        return '{token: $token, user: $user}';
    }
}