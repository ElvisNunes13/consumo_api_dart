import 'dart:convert';
import 'package:consumo_api/models/students.dart';
import 'package:http/http.dart' as http;

class StudentRepository {
  Future<List<Students>> findAll() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('Nenhum estudante foi encontrado');
    }

    return responseData.map((student) {
      return Students.fromMap(student);
    }).toList();
  }

  Future<Students> findById(int id) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    if (response == '{}') {
      throw Exception();
    }

    return Students.fromJson(response.body);
  }

  Future<void> insertStudent(Students student) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/students'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response != 200) {
      throw Exception();
    }
  }

  Future<void> updateStudent(Students student) async {
    final response = await http.put(
      Uri.parse('http://localhost:8080/students/${student.id}'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response != 200) {
      throw Exception();
    }
  }

  Future<void> deleteStudent(int id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:8080/students/$id'));

    if (response != 200) {
      throw Exception();
    }
  }
}
