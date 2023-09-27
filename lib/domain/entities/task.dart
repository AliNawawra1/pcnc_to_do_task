class Task implements Copyable<Task> {
  int? id;
  final String title;
  final String? description;
  DateTime? dueDate;
  final DateTime creationDate;
  bool isCompleted;
  bool isPrivate;
  int categoryId;

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

  @override
  Task copy() => Task(
        id: id,
        title: title,
        description: description,
        dueDate: dueDate,
        creationDate: creationDate,
        isCompleted: isCompleted,
        isPrivate: isPrivate,
        categoryId: categoryId,
      );

  @override
  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? dueDate,
    DateTime? creationDate,
    bool? isCompleted,
    bool? isPrivate,
    int? categoryId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      creationDate: creationDate ?? this.creationDate,
      isCompleted: isCompleted ?? this.isCompleted,
      isPrivate: isPrivate ?? this.isPrivate,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

abstract interface class CopyableWithOnly<R> implements _CopyWith<R> {}

abstract interface class Copyable<R> extends _CopyWith<R> {
  R copy();
}

abstract interface class _CopyWith<R> {
  R copyWith();
}
