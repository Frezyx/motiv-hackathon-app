import 'dart:convert';

import 'interfaces/user_interface.dart';

class HumanResourceUser implements UserInterface {
  final int id;
  final String login;
  final String name;
  final String passWord;
  HumanResourceUser({
    this.id,
    this.login,
    this.name,
    this.passWord,
  });

  HumanResourceUser copyWith({
    int id,
    String login,
    String name,
    String passWord,
  }) {
    return HumanResourceUser(
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

  factory HumanResourceUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HumanResourceUser(
      id: map['id'],
      login: map['login'],
      name: map['name'],
      passWord: map['passWord'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HumanResourceUser.fromJson(String source) =>
      HumanResourceUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HumanResourceUser(id: $id, login: $login, name: $name, passWord: $passWord)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HumanResourceUser &&
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
