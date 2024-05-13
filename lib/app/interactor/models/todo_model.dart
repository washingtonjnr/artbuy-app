class TodoModel {
  final int id;
  final String name;
  final bool check;

  TodoModel({
    required this.id,
    required this.name,
    required this.check,
  });

  TodoModel copyWith({int? id, String? name, bool? check}) {
    return TodoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      check: check ?? this.check,
    );
  }
}
