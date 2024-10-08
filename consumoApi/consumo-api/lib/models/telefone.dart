import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'tefefone': telefone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(ddd: map['ddd'] ?? 0, telefone: map['telefone'] ?? '');
  }

  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));
}
