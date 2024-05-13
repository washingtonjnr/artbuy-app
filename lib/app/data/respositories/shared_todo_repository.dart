import 'dart:convert';
// Data
import 'package:artbuy/app/data/adapters/todo_adapter.dart';
// Interactors
import 'package:artbuy/app/interactor/models/todo_model.dart';
import 'package:artbuy/app/interactor/repositories/todo_repository.dart';
// Shared Preferences
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'TODO_LIST';

class SharedTodoRepository implements TodoRepository {
  @override
  Future<List<TodoModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);

    if (json == null) return [];

    final list = jsonDecode(json) as List;

    return list.map((item) => TodoAdapter.fromMap(item)).toList();
  }

  @override
  Future<TodoModel> get(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;

    final index = list.indexWhere((e) => e['id'] == id);

    if (index == -1) throw Exception('Todo not found');

    return TodoAdapter.fromMap(list[index]);
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;

    final id = list.isEmpty ? 1 : (list.last['id'] + 1);
    final newModel = model.copyWith(id: id);

    list.add(TodoAdapter.toMap(newModel));

    await shared.setString(_key, jsonEncode(list));

    return newModel;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;

    final index = list.indexWhere((e) => e['id'] == model.id);

    if (index == -1) throw Exception('Todo not found');

    list[index] = TodoAdapter.toMap(model);

    await shared.setString(_key, jsonEncode(list));

    return model;
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;

    final index = list.indexWhere((e) => e['id'] == id);

    if (index == -1) return false;

    list.removeAt(index);

    await shared.setString(_key, jsonEncode(list));

    return true;
  }

  // Future<Set<Object>> _getSharedAndList() async {
  //   final shared = await SharedPreferences.getInstance();
  //   final json = shared.getString(_key) ?? '[]';
  //   final list = jsonDecode(json) as List;

  //   return {shared, list};
  // }
}
