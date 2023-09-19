import 'package:pcnc_todo_task/data/database/database_provider.dart';
import 'package:pcnc_todo_task/domain/entities/task.dart';
import 'package:pcnc_todo_task/domain/interactors/task_interactor.dart';

class TaskDataSource implements TaskInteractor {
  final DatabaseProvider database;

  TaskDataSource() : database = DatabaseProvider.instance;

  @override
  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> taskMaps =
        await database.db.query('tasks');
    return taskMaps.map((map) => Task.fromMap(map)).toList();
  }

  @override
  Future<List<Task>> getTasksByCategory(int categoryId) async {
    final List<Map<String, dynamic>> taskMaps = await database.db.query(
      'tasks',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return taskMaps.map((map) => Task.fromMap(map)).toList();
  }

  @override
  Future<List<Task>> getCompletedTasks() async {
    final List<Map<String, dynamic>> taskMaps = await database.db.query(
      'tasks',
      where: 'isCompleted = ?',
      whereArgs: [1],
    );
    return taskMaps.map((map) => Task.fromMap(map)).toList();
  }

  @override
  Future<List<Task>> getTodayTasks() async {
    final DateTime today = DateTime.now();
    final List<Map<String, dynamic>> taskMaps = await database.db.query(
      'tasks',
      where: 'dueDate = ?',
      whereArgs: [today.toLocal().toString().split(' ')[0]],
    );
    return taskMaps.map((map) => Task.fromMap(map)).toList();
  }

  @override
  Future<int> insertTask(Task task) async {
    return await database.db.insert('tasks', task.toMap());
  }

  @override
  Future<void> updateTask(Task task) async {
    await database.db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await database.db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }
}
