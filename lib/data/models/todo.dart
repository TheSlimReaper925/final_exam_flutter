class Todo {
  int? id;
  String? todo;
  bool? isDone;
  String? description;

  Todo({this.id, this.todo, this.isDone, this.description});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      todo: json['todo'],
      isDone: json['isDone'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson(dynamic todo) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = todo['name'];
    data['todo'] = todo['todo'];
    data['isDone'] = todo['isDone'];
    data['description'] = todo['description'];
    return data;
  }
}
