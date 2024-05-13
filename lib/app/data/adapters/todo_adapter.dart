import 'package:artbuy/app/interactor/models/todo_model.dart';

class TodoAdapter {
  static Map<String, dynamic> toMap(TodoModel todo) {
    return {
      'id': todo.id,
      'name': todo.name,
      'check': todo.check,
    };
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      name: map['name'],
      check: map['check'],
    );
  }
}
