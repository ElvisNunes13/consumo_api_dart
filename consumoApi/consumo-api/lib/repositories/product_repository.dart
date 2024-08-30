import 'dart:convert';

import 'package:consumo_api/models/courses.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<Courses> findByName(String name) async {
    final response =
        await http.get(Uri.parse('localhost:8080/products?name=$name'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('Produto não encontrado');
    }

    return Courses.fromMap(responseData.first);
  }
}
