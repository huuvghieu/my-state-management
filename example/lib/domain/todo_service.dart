import '../data/todo_model.dart';
import '../data/todo_repository.dart';

class TodoService {
  final TodoRepository _todoRepository;

  TodoService(this._todoRepository);

  List<TodoModel> getTodos() {
    return _todoRepository.getTodos();
  }

  void addTodo(String title) {
    final todo = TodoModel(id: DateTime.now().toString(), title: title);
    _todoRepository.addTodo(todo);
  }

  void toggleCompletion(String id) {
    _todoRepository.toggleCompletion(id);
  }

  void removeTodo(String id) {
    _todoRepository.removeTodo(id);
  }
}
