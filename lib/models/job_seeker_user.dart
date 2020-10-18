import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:motiv_hackathon_app/data/prepare/prepare.dart';

import 'interfaces/user_interface.dart';

class JobSeekerUser implements UserInterface {
  final String id;
  final String name;
  final int salary;
  final List<String> employment;
  final List<String> workSchedule;
  final int age;
  final String education;
  final String workExpTime;
  final List<String> abilities;
  final bool isDriver;
  final List<String> languages;
  final String qualifications;
  final String aboutPerson;
  final String workDescription;
  final int botKey;
  final bool botVerified;
  final String phone;
  bool interesting;
  String image;

  JobSeekerUser({
    this.id,
    this.name,
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
    this.interesting,
    this.image,
  });

  JobSeekerUser copyWith({
    String id,
    String name,
    int salary,
    List<String> employment,
    List<String> workSchedule,
    int age,
    String education,
    String workExpTime,
    List<String> abilities,
    bool isDriver,
    List<String> languages,
    String qualifications,
    String aboutPerson,
    String workDescription,
    int botKey,
    bool botVerified,
    String phone,
    bool interesting,
    String image,
  }) {
    return JobSeekerUser(
      id: id ?? this.id,
      name: name ?? this.name,
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
      interesting: interesting ?? this.interesting,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
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
      'interesting': interesting,
      'image': image,
    };
  }

  factory JobSeekerUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JobSeekerUser(
      id: map['id'],
      name: map['name'],
      salary: map['salary'],
      employment: List<String>.from(map['employment']),
      workSchedule: List<String>.from(map['workSchedule']),
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
      interesting: map['interesting'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JobSeekerUser.fromJson(String source) =>
      JobSeekerUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobSeekerUser(id: $id, name: $name, salary: $salary, employment: $employment, workSchedule: $workSchedule, age: $age, education: $education, workExpTime: $workExpTime, abilities: $abilities, isDriver: $isDriver, languages: $languages, qualifications: $qualifications, aboutPerson: $aboutPerson, workDescription: $workDescription, botKey: $botKey, botVerified: $botVerified, phone: $phone, interesting: $interesting, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JobSeekerUser &&
        o.id == id &&
        o.name == name &&
        o.salary == salary &&
        listEquals(o.employment, employment) &&
        listEquals(o.workSchedule, workSchedule) &&
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
        o.phone == phone &&
        o.interesting == interesting &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
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
        phone.hashCode ^
        interesting.hashCode ^
        image.hashCode;
  }

  Future like(state) async {
    this.interesting =
        await RequestPrepare.likeUser(this, state) ? state : null;
  }
}
