import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/presentation/features/task/controllers/base_task_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/task.dart';
import '../../../../domain/interactors_impl/task_interactor_impl.dart';
import '../../../../shared/widgets/custom_row_buttons.dart';
import '../../dashbord/controllers/home_screen_controller.dart';
import '../../dashbord/screens/home_screen.dart';
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
    final updatedTask = Task(
      id: taskToEdit.value.id,
      title: title,
      description: description,
      dueDate: taskToEdit.value.dueDate,
      creationDate: taskToEdit.value.creationDate,
      isCompleted: taskToEdit.value.isCompleted,
      isPrivate: taskToEdit.value.isPrivate,
      categoryId: taskToEdit.value.categoryId,
    );
    await taskInteractorImpl.updateTask(updatedTask);
    homeController.loadTasks();
    taskToEdit.value = updatedTask;
    Get.back();
  }

  Future<void> updateDueDate(BuildContext context) async {
    dateTimeController.updateSelectedDateTime(taskToEdit.value.dueDate!);
    await dateTimeController.selectDate(context);
    final newDueDate = dateTimeController.getCombinedDateTime();

    final updatedTask = Task(
      id: taskToEdit.value.id,
      title: taskToEdit.value.title,
      description: taskToEdit.value.description,
      dueDate: newDueDate,
      creationDate: taskToEdit.value.creationDate,
      isCompleted: taskToEdit.value.isCompleted,
      isPrivate: taskToEdit.value.isPrivate,
      categoryId: taskToEdit.value.categoryId,
    );
    await taskInteractorImpl.updateTask(updatedTask);
    homeController.loadTasks();
    taskToEdit.value = updatedTask;
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
    final updatedTask = Task(
      id: taskToEdit.value.id,
      title: taskToEdit.value.title,
      description: taskToEdit.value.description,
      dueDate: taskToEdit.value.dueDate,
      creationDate: taskToEdit.value.creationDate,
      isCompleted: taskToEdit.value.isCompleted,
      isPrivate: taskToEdit.value.isPrivate,
      categoryId: categoryId!,
    );

    await taskInteractorImpl.updateTask(updatedTask);
    homeController.loadTasks();
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
    Get.dialog(
      AlertDialog(
        title: const Center(child: Text("Delete Task")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(thickness: 3, height: 30, color: Colors.white),
            Center(
              child: Text(
                  "Are you sure you want to delete this task? \n\n Task title: ${taskToEdit.value.title}",
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        actions: [
          CustomRowButtons(
            buttonText: 'Delete',
            onTap: () {
              onTaskDelete();
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void onTaskDelete() async {
    Task task = taskToEdit.value;

    await taskInteractorImpl.deleteTask(task.id!);

    Future.delayed(const Duration(seconds: 1), () {
      Get.offAll(() => const HomeScreen());
    });
  }
}
