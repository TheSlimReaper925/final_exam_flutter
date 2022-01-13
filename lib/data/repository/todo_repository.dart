import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_exam_task/data/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Dio dio = Dio();
  Future<List<Todo>> fetchTodos() async {
    List<Todo>? todoList = [];
    final response = await dio.get('http://10.0.2.2:8080/todos');
    if (response.statusCode == 200) {
      response.data.forEach((todo) {
        todoList.add(Todo.fromJson(todo));
      });
    }
    return todoList;
  }

  deleteTodos(int id) async {
    String url = 'http://10.0.2.2:8080/delete-todo/' + id.toString();
    await dio.delete(url);
  }

  markDone(int id) async {
    String url = 'http://10.0.2.2:8080/todo-done/' + id.toString();
    await dio.patch(url);
  }

  addTodos(int id, String todo, String description) async {
    //I HATE DIO AND HTTP CREATORS!!!
    var client = http.Client();
    String url = '10.0.2.2:8000';
    String route = '/add-todo';
    try {
      var response = await client.post(
        Uri.http(url, route),
        body: jsonEncode({
          'id': id.toString(),
          'todo': todo,
          'done': 'false',
          'description': description
        }),
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }

  updateTodo(int id, String todo, String description) async {
    String url = 'http://10.0.2.2:8080/update-todo';
    final response = dio.put(
      url,
      data: {'id': id, 'todo': todo, 'description': description},
    );
    print(response);
  }
}
