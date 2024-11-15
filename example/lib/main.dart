import 'package:example/data/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:my_state_management/my_state_management.dart';
import 'data/todo_repository.dart';
import 'domain/todo_service.dart';
import 'presentation/home_page.dart';

void main() {
  final stateManager = StateManager();
  final todoRepository = TodoRepository();
  final todoService = TodoService(todoRepository);

  stateManager.initializeState<List<TodoModel>>('todos', todoService.getTodos());

  runApp(MyApp(
    stateManager: stateManager,
    todoService: todoService,
  ));
}

class MyApp extends StatelessWidget {
  final StateManager stateManager;
  final TodoService todoService;

  const MyApp(
      {super.key, required this.stateManager, required this.todoService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        stateManager: stateManager,
        todoService: todoService,
      ),
    );
  }
}
