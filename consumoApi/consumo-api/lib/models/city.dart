// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class City {
  int id;
  String name;

  City({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}
