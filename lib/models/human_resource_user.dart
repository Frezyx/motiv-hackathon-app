import 'dart:convert';

import 'interfaces/user_interface.dart';

class HumanResourceUser implements UserInterface {
  final int id;
  final String login;
  final String username;
  final String password;
  HumanResourceUser({
    this.id,
    this.login,
    this.username,
    this.password,
  });

  HumanResourceUser copyWith({
    int id,
    String login,
    String username,
    String password,
  }) {
    return HumanResourceUser(
      id: id ?? this.id,
      login: login ?? this.login,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'username': username,
      'password': password,
    };
  }

  factory HumanResourceUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HumanResourceUser(
      id: map['id'],
      login: map['login'],
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HumanResourceUser.fromJson(String source) =>
      HumanResourceUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HumanResourceUser(id: $id, login: $login, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HumanResourceUser &&
        o.id == id &&
        o.login == login &&
        o.username == username &&
        o.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ login.hashCode ^ username.hashCode ^ password.hashCode;
  }
}
