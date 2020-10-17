import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'interfaces/user_interface.dart';

class JobSeekerUser implements UserInterface {
  final String id;
  final String salary;
  final String employment;
  final String workSchedule;
  final String age;
  final String education;
  final String workExpTime;
  final List<String> abilities;
  final String isDriver;
  final List<String> languages;
  final String qualifications;
  final String aboutPerson;
  final String workDescription;
  final int botKey;
  final bool botVerified;
  final String phone;

  JobSeekerUser({
    this.id,
    this.salary,
    this.employment,
    this.workSchedule,
    this.age,
    this.education,
    this.workExpTime,
    this.abilities,
    this.isDriver,
    this.languages,
    this.qualifications,
    this.aboutPerson,
    this.workDescription,
    this.botKey,
    this.botVerified,
    this.phone,
  });

  JobSeekerUser copyWith({
    String id,
    String salary,
    String employment,
    String workSchedule,
    String age,
    String education,
    String workExpTime,
    List<String> abilities,
    String isDriver,
    List<String> languages,
    String qualifications,
    String aboutPerson,
    String workDescription,
    int botKey,
    bool botVerified,
    String phone,
  }) {
    return JobSeekerUser(
      id: id ?? this.id,
      salary: salary ?? this.salary,
      employment: employment ?? this.employment,
      workSchedule: workSchedule ?? this.workSchedule,
      age: age ?? this.age,
      education: education ?? this.education,
      workExpTime: workExpTime ?? this.workExpTime,
      abilities: abilities ?? this.abilities,
      isDriver: isDriver ?? this.isDriver,
      languages: languages ?? this.languages,
      qualifications: qualifications ?? this.qualifications,
      aboutPerson: aboutPerson ?? this.aboutPerson,
      workDescription: workDescription ?? this.workDescription,
      botKey: botKey ?? this.botKey,
      botVerified: botVerified ?? this.botVerified,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'salary': salary,
      'employment': employment,
      'workSchedule': workSchedule,
      'age': age,
      'education': education,
      'workExpTime': workExpTime,
      'abilities': abilities,
      'isDriver': isDriver,
      'languages': languages,
      'qualifications': qualifications,
      'aboutPerson': aboutPerson,
      'workDescription': workDescription,
      'botKey': botKey,
      'botVerified': botVerified,
      'phone': phone,
    };
  }

  factory JobSeekerUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JobSeekerUser(
      id: map['id'],
      salary: map['salary'],
      employment: map['employment'],
      workSchedule: map['workSchedule'],
      age: map['age'],
      education: map['education'],
      workExpTime: map['workExpTime'],
      abilities: List<String>.from(map['abilities']),
      isDriver: map['isDriver'],
      languages: List<String>.from(map['languages']),
      qualifications: map['qualifications'],
      aboutPerson: map['aboutPerson'],
      workDescription: map['workDescription'],
      botKey: map['botKey'],
      botVerified: map['botVerified'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JobSeekerUser.fromJson(String source) =>
      JobSeekerUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobSeekerUser(id: $id, salary: $salary, employment: $employment, workSchedule: $workSchedule, age: $age, education: $education, workExpTime: $workExpTime, abilities: $abilities, isDriver: $isDriver, languages: $languages, qualifications: $qualifications, aboutPerson: $aboutPerson, workDescription: $workDescription, botKey: $botKey, botVerified: $botVerified, phone: $phone)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JobSeekerUser &&
        o.id == id &&
        o.salary == salary &&
        o.employment == employment &&
        o.workSchedule == workSchedule &&
        o.age == age &&
        o.education == education &&
        o.workExpTime == workExpTime &&
        listEquals(o.abilities, abilities) &&
        o.isDriver == isDriver &&
        listEquals(o.languages, languages) &&
        o.qualifications == qualifications &&
        o.aboutPerson == aboutPerson &&
        o.workDescription == workDescription &&
        o.botKey == botKey &&
        o.botVerified == botVerified &&
        o.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        salary.hashCode ^
        employment.hashCode ^
        workSchedule.hashCode ^
        age.hashCode ^
        education.hashCode ^
        workExpTime.hashCode ^
        abilities.hashCode ^
        isDriver.hashCode ^
        languages.hashCode ^
        qualifications.hashCode ^
        aboutPerson.hashCode ^
        workDescription.hashCode ^
        botKey.hashCode ^
        botVerified.hashCode ^
        phone.hashCode;
  }
}
