import 'package:flutter/material.dart';
import 'package:my_state_management/my_state_management.dart';
import '../data/todo_model.dart';
import '../domain/todo_service.dart';
import 'widgets/todo_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key, required this.todoService, required this.stateManager});

  final TodoService todoService;
  final StateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Example adding a new To-Do
              todoService.addTodo('New Todo');
              stateManager.updateState('todos', todoService.getTodos());
            },
            child: const Text('Add To-Do'),
          ),
          Expanded(
            child: StateListener<List<TodoModel>>(
              stateKey: 'todos',
              stateManager: stateManager,
              builder: (context, todos) {
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return TodoItemWidget(
                      todoModel: todo,
                      onToggle: () {
                        todoService.toggleCompletion(todo.id);
                        stateManager.updateState(
                            'todos', todoService.getTodos());
                      },
                      onRemove: () {
                        todoService.removeTodo(todo.id);
                        stateManager.updateState(
                            'todos', todoService.getTodos());
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
