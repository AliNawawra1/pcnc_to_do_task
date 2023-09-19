class Task {
  int? id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final DateTime creationDate;
  final bool isCompleted;
  final bool isPrivate;
  final int categoryId;

  Task({
    this.id,
    required this.title,
    this.description,
    this.dueDate,
    required this.creationDate,
    this.isCompleted = false,
    this.isPrivate = false,
    required this.categoryId,
  });

  // Convert a Task object to a map (for database storage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
      'creationDate': creationDate.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
      'isPrivate': isPrivate ? 1 : 0,
      'categoryId': categoryId,
    };
  }

  // Create a Task object from a map (from database)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
        creationDate: DateTime.parse(map['creationDate']),
      isCompleted: map['isCompleted'] == 1,
      isPrivate: map['isPrivate'] == 1,
      categoryId: map['categoryId'],
    );
  }
}
