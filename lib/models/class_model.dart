class Todo {
  final String id;
  final String title;
  final String date;
  final String description;
  final String className;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.className,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['_id'] ?? '',
    title: json['title'] ?? '',
    date: json['date'] ?? '',
    description: json['description'] ?? '',
    className: json['className'] ?? '',
    completed: json['completed'] ?? false,
  );
}
