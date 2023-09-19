import 'package:pcnc_todo_task/data/data_sources/task_data_source.dart';
import 'package:pcnc_todo_task/domain/entities/task.dart';
import 'package:pcnc_todo_task/domain/interactors/task_interactor.dart';

class TaskInteractorImpl implements TaskInteractor {
  final TaskDataSource taskDataSource;

  TaskInteractorImpl() : taskDataSource = TaskDataSource();

  @override
  Future<List<Task>> getTasks() {
    return taskDataSource.getTasks();
  }

  @override
  Future<List<Task>> getTasksByCategory(int categoryId) {
    return taskDataSource.getTasksByCategory(categoryId);
  }

  @override
  Future<List<Task>> getCompletedTasks() {
    return taskDataSource.getCompletedTasks();
  }

  @override
  Future<List<Task>> getTodayTasks() {
    return taskDataSource.getTodayTasks();
  }

  @override
  Future<int> insertTask(Task task) {
    return taskDataSource.insertTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return taskDataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(int taskId) {
    return taskDataSource.deleteTask(taskId);
  }
}
