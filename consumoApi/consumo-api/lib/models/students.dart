// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api/models/address.dart';
import 'package:consumo_api/models/courses.dart';

class Students {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Address address;

  Students({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age ?? null,
      'nameCourses': nameCourses,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      nameCourses: map['nameCourses'] ?? [],
      courses: map['courses']
          .map<Courses>((course) => Courses.fromMap(course))
          .toList(),
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }

  factory Students.fromJson(String source) =>
      Students.fromMap(json.decode(source));
}
