import 'package:auto_injector/auto_injector.dart';
// Data
import 'package:artbuy/app/data/respositories/shared_todo_repository.dart';
// Interactor
import 'package:artbuy/app/interactor/repositories/todo_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<TodoRepository>(SharedTodoRepository.new);
}
