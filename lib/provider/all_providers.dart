import 'package:f_todo/models/todo_model.dart';
import 'package:f_todo/services/todo_list_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =
    StateNotifierProvider<TodoListService, List<TodoModel>>(((ref) {
  return TodoListService([
    TodoModel(id: const Uuid().v4(), description: "corek al"),
    TodoModel(id: const Uuid().v4(), description: "su al"),
    TodoModel(id: const Uuid().v4(), description: 'ders oxu'),
  ]);
}));
