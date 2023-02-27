import 'package:f_todo/models/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class TodoListService extends StateNotifier<List<TodoModel>> {
  TodoListService(List<TodoModel>? initialTodo) : super(initialTodo ?? []);

  void addTodo(String description) {
    state = [
      ...state,
      TodoModel(id: const Uuid().v4(), description: description)
    ];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: todo.description,
            isCompleted: !todo.isCompleted,
          )
        else
          todo
    ];
  }

  void updateTodo({required String id, required String description}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              isCompleted: todo.isCompleted,
              description: description)
        else
          todo
    ];
  }

  void deleteTodo(TodoModel todo) {
    state = state.where((element) => element.id != todo.id).toList();
  }
}
