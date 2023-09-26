import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pcnc_todo_task/presentation/features/task/controllers/base_task_controller.dart';
import '../../dashboard/controllers/home_screen_controller.dart';
import '/domain/entities/task.dart';
import '/domain/interactors_impl/task_interactor_impl.dart';

class TaskAdditionController extends BaseTaskController {
  final TaskInteractorImpl taskInteractorImpl = TaskInteractorImpl();
  final HomeController homeController = Get.find();

  TaskAdditionController() : super();

  void onAdd() async {
    if (!validate()) return;
    final title = taskTitleController.text.trim();
    final description = taskDescriptionController.text;
    final dueDate = selectedDueDate.value;
    final creationDate = DateTime.now();
    final categoryId = selectedCategory.value!.id;

    final task = Task(
      title: title,
      description: description,
      dueDate: dueDate,
      creationDate: creationDate,
      categoryId: categoryId!,
    );
    await taskInteractorImpl.insertTask(task);

    homeController.loadTasks();

    clearAll();
    Get.back();
    Get.snackbar('Success!', 'Task has been added!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }
}
