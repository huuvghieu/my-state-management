import 'package:flutter/material.dart';

import '../../data/todo_model.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  const TodoItemWidget({
    super.key,
    required this.todoModel,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoModel.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(todoModel.isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank),
            onPressed: onToggle,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
