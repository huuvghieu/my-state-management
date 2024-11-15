import 'todo_model.dart';

class TodoRepository {
  final List<TodoModel> _listTodo = [
  TodoModel(
    id: DateTime.now().toIso8601String(),
    title: 'Buy groceries',
  ),
  TodoModel(
    id: DateTime.now().add(const Duration(seconds: 1)).toIso8601String(),
    title: 'Walk the dog',
  ),
  TodoModel(
    id: DateTime.now().add(const Duration(seconds: 2)).toIso8601String(),
    title: 'Complete Flutter project',
  ),
  TodoModel(
    id: DateTime.now().add(const Duration(seconds: 3)).toIso8601String(),
    title: 'Read a book',
    isCompleted: true,
  ),
  TodoModel(
    id: DateTime.now().add(const Duration(seconds: 4)).toIso8601String(),
    title: 'Workout at the gym',
  ),
];

  List<TodoModel> getTodos() => _listTodo;

  void addTodo(TodoModel todoModel) {
    _listTodo.add(todoModel);
  }

  void toggleCompletion(String id) {
    final todoModel = _listTodo.firstWhere(
      (e) => e.id == id,
    );
    todoModel.isCompleted = !todoModel.isCompleted;
  }

  void removeTodo(String id) {
    _listTodo.removeWhere(
      (e) => e.id == id,
    );
  }
}
