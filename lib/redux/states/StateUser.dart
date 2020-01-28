/// 用户信息
class StateUser {
    final String token;
    final String id;

    StateUser(this.token, this.id);

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