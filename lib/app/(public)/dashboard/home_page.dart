import 'package:flutter/material.dart';
// Packages
import 'package:asp/asp.dart';
// Interactors
import 'package:artbuy/app/interactor/atoms/todo_atom.dart';
import 'package:artbuy/app/interactor/models/todo_model.dart';
import 'package:artbuy/app/interactor/actions/todo_actions.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();

    fetchTodos();
  }

  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, name: '', check: false);

    bool isCreated = model.id == -1;

    print('model');
    print(model.toString());
    print(model.id);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(isCreated == true ? 'Create todo' : 'Edit todo'),
          content: TextFormField(
            initialValue: model!.name,
            onChanged: (value) {
              model = model!.copyWith(name: value);

              putTodo(model!);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                deleteTodo(model!.id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                if (model!.id != -1) {
                  putTodo(model!);
                } else {
                  createTodo(model!);
                }
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final todos = todoState.value;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home page'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: editTodoDialog,
            child: const Icon(Icons.add),
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) {
              final todo = todos[index];

              return GestureDetector(
                onLongPress: () {
                  editTodoDialog(todo);
                },
                child: CheckboxListTile(
                  value: todo.check,
                  title: Text(todo.name),
                  onChanged: (value) {
                    putTodo(todo.copyWith(check: value));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
