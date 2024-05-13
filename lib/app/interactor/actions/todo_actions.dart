// Injector
import 'package:artbuy/app/injector.dart';
// Interactors
import 'package:artbuy/app/interactor/atoms/todo_atom.dart';
import 'package:artbuy/app/interactor/models/todo_model.dart';
import 'package:artbuy/app/interactor/repositories/todo_repository.dart';

Future<void> fetchTodos() async {
  final repository = injector.get<TodoRepository>();

  todoState.value = await repository.getAll();
}

Future<void> createTodo(TodoModel model) async {
  final repository = injector.get<TodoRepository>();

  await repository.insert(model);

  // Reload list
  fetchTodos();
}

Future<void> putTodo(TodoModel model) async {
  final repository = injector.get<TodoRepository>();

  await repository.update(model);

  // Reload list
  fetchTodos();
}

Future<void> deleteTodo(int id) async {
  final repository = injector.get<TodoRepository>();

  await repository.delete(id);

  // Reload list
  fetchTodos();
}
