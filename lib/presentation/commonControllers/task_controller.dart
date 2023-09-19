import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/entities/task.dart';
import 'package:pcnc_todo_task/domain/interactors_impl/task_interactor_impl.dart';

import '../../domain/entities/category.dart';

class TaskController {
  final TaskInteractorImpl taskInteractorImpl;
  final RxList<Task> tasks = <Task>[].obs;
  Rx<Category?> selectedCategory = Rx<Category?>(null);
  Rx<DateTime> selectedTaskDate = DateTime.now().obs;

  // Add these two controllers for task name and description
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  TaskController() : taskInteractorImpl = TaskInteractorImpl();

  Future<void> fetchTasks() async {
    List<Task> taskList = await taskInteractorImpl.getTasks();
    tasks.assignAll(taskList);
  }

  Future<List<Task>> fetchTasksByCategory(int categoryId) async {
    return await taskInteractorImpl.getTasksByCategory(categoryId);
  }

  Future<List<Task>> fetchCompletedTasks() async {
    return await taskInteractorImpl.getCompletedTasks();
  }

  Future<List<Task>> fetchTodayTasks() async {
    return await taskInteractorImpl.getTodayTasks();
  }

  Future<int> addTask(Task task) async {
    int taskId = await taskInteractorImpl.insertTask(task);
    if (taskId > 0) {
      task.id = taskId;
      tasks.add(task);
    }
    return taskId;
  }

  Future<void> updateTask(Task task) async {
    await taskInteractorImpl.updateTask(task);
    int index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  Future<void> deleteTask(int taskId) async {
    await taskInteractorImpl.deleteTask(taskId);
    tasks.removeWhere((t) => t.id == taskId);
  }

  void setTaskDate(DateTime date) {
    selectedTaskDate.value = date;
  }
}
