import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/presentation/features/task/controllers/base_task_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/task.dart';
import '../../../../domain/interactors_impl/task_interactor_impl.dart';

import '../../dashboard/controllers/home_screen_controller.dart';
import '../../dashboard/screens/home_screen.dart';
import '../widgets/edit_task_widgets/delete_task_dialog.dart';
import 'date_time_controller.dart';

class TaskEditingController extends BaseTaskController {
  Rx<Task> taskToEdit;
  final TaskInteractorImpl taskInteractorImpl = TaskInteractorImpl();
  final HomeController homeController = Get.find();
  final DateTimeController dateTimeController = Get.put(DateTimeController());

  TaskEditingController(this.taskToEdit) : super();

  @override
  void onInit() {
    super.onInit();
    setInitialText();
  }

  void setInitialText() {
    taskTitleController.text = taskToEdit.value.title;
    taskDescriptionController.text = taskToEdit.value.description ?? '';
  }

  void updateTextFields() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final title = taskTitleController.text.trim();
    final description = taskDescriptionController.text;
    final updatedTask =
        taskToEdit.value.copyWith(title: title, description: description);
    updateAndSaveTask(updatedTask);
  }

  Future<void> updateDueDate(BuildContext context) async {
    dateTimeController.updateSelectedDateTime(taskToEdit.value.dueDate!);
    await dateTimeController.selectDate(context);
    final newDueDate = dateTimeController.getCombinedDateTime();

    final updatedTask = taskToEdit.value.copyWith(dueDate: newDueDate);
    updateAndSaveTask(updatedTask);
  }

  Future<void> updateCategory() async {
    if (isMissingCategory) {
      Get.defaultDialog(
          title: 'Missing Category',
          middleText: 'Please select a Category.',
          textConfirm: 'OK',
          onConfirm: Get.back);
    }
    final categoryId = selectedCategory.value!.id;
    final updatedTask = taskToEdit.value.copyWith(categoryId: categoryId);
    updateAndSaveTask(updatedTask);
  }

  Future<void> updateAndSaveTask(Task updatedTask) async {
    await taskInteractorImpl.updateTask(updatedTask);
    homeController.loadTasks();
    taskToEdit.value = updatedTask;
    Get.back();
  }

  void toggleTaskCompletion(Task task) async {
    if (task.isCompleted) {
      Get.snackbar(
          'Task Already Completed', 'This task is already marked as complete.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
      return;
    }
    task.isCompleted = !task.isCompleted;
    await homeController.taskInteractorImpl.updateTask(task);

    int index = homeController.tasks.indexOf(task);
    if (index != -1) homeController.tasks[index] = task;
    Get.back();
  }

  void shareTask() {
    Share.share('Task Title: ${taskToEdit.value.title}',
        subject: 'Task Details');
  }

  void showDeleteDialog() {
    Get.dialog(DeleteTaskDialog(
        taskTitle: taskToEdit.value.title, onDeleteTap: onTaskDelete));
  }

  void onTaskDelete() async {
    await taskInteractorImpl.deleteTask(taskToEdit.value.id!);
    Get.offAll(() => const HomeScreen());
  }
}
