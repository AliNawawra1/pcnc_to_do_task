import 'package:pcnc_todo_task/domain/entities/task.dart';

abstract class TaskInteractor {
  Future<List<Task>> getTasks();

  Future<List<Task>> getTasksByCategory(int categoryId);

  Future<List<Task>> getCompletedTasks();

  Future<List<Task>> getTodayTasks();

  Future<void> insertTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(int taskId);
}
