import 'dart:convert';

import 'interfaces/user_interface.dart';

class User implements UserInterface {
  final int id;
  final String login;
  final String name;
  final String passWord;
  User({
    this.id,
    this.login,
    this.name,
    this.passWord,
  });

  User copyWith({
    int id,
    String login,
    String name,
    String passWord,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      name: name ?? this.name,
      passWord: passWord ?? this.passWord,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'name': name,
      'passWord': passWord,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      login: map['login'],
      name: map['name'],
      passWord: map['passWord'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, login: $login, name: $name, passWord: $passWord)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.id == id &&
        o.login == login &&
        o.name == name &&
        o.passWord == passWord;
  }

  @override
  int get hashCode {
    return id.hashCode ^ login.hashCode ^ name.hashCode ^ passWord.hashCode;
  }
}
