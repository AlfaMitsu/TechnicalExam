import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_exam/models/Todo_model.dart';

class TodoApiService {
  final String apiUrl;

  TodoApiService(this.apiUrl);

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['todos'];
      return data.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
