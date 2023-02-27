import 'package:f_todo/models/todo_model.dart';
import 'package:f_todo/provider/all_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListItemWidget extends ConsumerWidget {
  TodoModel item;
  TodoListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.isCompleted,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toggle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
