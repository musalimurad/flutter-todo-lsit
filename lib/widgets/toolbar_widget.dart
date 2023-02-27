import 'package:f_todo/provider/all_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = ref
        .watch(todoListProvider)
        .where((element) => !element.isCompleted)
        .length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(count == 0
              ? "hamisi tamamlandi"
              : (count.toString() + " tamamlanmamis")),
        ),
        Tooltip(
          message: 'All todo',
          child: TextButton(onPressed: () {}, child: const Text('All')),
        ),
        Tooltip(
          message: 'Active todo',
          child: TextButton(onPressed: () {}, child: const Text('Active')),
        ),
        Tooltip(
          message: 'Completed todo',
          child: TextButton(onPressed: () {}, child: const Text('Completed')),
        ),
      ],
    );
  }
}
