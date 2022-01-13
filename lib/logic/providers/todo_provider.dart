import 'package:final_exam_task/data/models/todo.dart';
import 'package:final_exam_task/data/repository/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  Future<List<Todo>> _todo = TodoRepository().fetchTodos();

  Future<List<Todo>> get todo => _todo;

  void fetchTodos() {
    _todo = TodoRepository().fetchTodos();
    notifyListeners();
  }
}
