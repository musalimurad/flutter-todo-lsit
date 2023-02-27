import 'package:f_todo/models/todo_model.dart';
import 'package:f_todo/provider/all_providers.dart';
import 'package:f_todo/services/todo_list_service.dart';
import 'package:f_todo/widgets/title_widget.dart';
import 'package:f_todo/widgets/todo_list_item_widget.dart';
import 'package:f_todo/widgets/toolbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodo = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: "Add todo item",
            ),
            onSubmitted: (description) {
              ref.read(todoListProvider.notifier).addTodo(description);
            },
          ),
          const SizedBox(height: 20.0),
          const ToolbarWidget(),
          for (var i = 0; i < allTodo.length; i++)
            Dismissible(
              key: ValueKey(allTodo[i].id),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).deleteTodo(allTodo[i]);
              },
              child: TodoListItemWidget(
                item: allTodo[i],
              ),
            ),
        ],
      ),
    );
  }
}
