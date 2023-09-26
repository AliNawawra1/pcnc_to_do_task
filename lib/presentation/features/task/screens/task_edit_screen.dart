import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import '../../../../domain/entities/task.dart';
import '../../category/screens/category_choose_screen.dart';
import '../controllers/task_editing_controller.dart';
import '../widgets/edit_task_widgets/close_edit_button.dart';
import '../widgets/edit_task_widgets/mark_complete_button.dart';
import '../widgets/edit_task_widgets/task_category_edit.dart';
import '../widgets/edit_task_widgets/task_operations.dart';
import '../widgets/edit_task_widgets/task_time_edit.dart';
import '../widgets/edit_task_widgets/title_description_edit_widget.dart';
import '/core/constants/palette.dart';

class EditTaskScreen extends StatelessWidget {
  final Rx<Task> task;
  final Rx<Category> category;

  const EditTaskScreen({super.key, required this.task, required this.category});

  @override
  Widget build(BuildContext context) {
    final TaskEditingController taskEditController =
        Get.put(TaskEditingController(task));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CloseEditionButton(),
                MarkAsCompleteButton(
                    taskEditController: taskEditController, task: task.value)
              ],
            ),
            TaskTextFieldsForEdit(
                task: task, taskEditingController: taskEditController),
            Obx(
              () => TaskTimeForEdit(
                infoText: taskEditController.taskToEdit.value.dueDate != null
                    ? DateFormat('hh:mm a')
                        .format(taskEditController.taskToEdit.value.dueDate!)
                    : '',
                onTap: () async {
                  await taskEditController.updateDueDate(context);
                },
              ),
            ),
            EditTaskCategoryWidget(
                category: category,
                onTap: () async {
                  var selectedCategory = await Get.dialog(CategoriesAlert(
                      elements: await categoryController.categoryInteractorImpl
                          .getCategories()));

                  taskEditController.setTaskCategory(selectedCategory);
                  taskEditController.updateCategory();
                }),
            Column(
              children: [
                const Divider(thickness: 2, height: 30, color: Colors.grey),
                TaskOperationRows(
                    icon: Icons.ios_share_outlined,
                    text: "Share Task",
                    onPressed: taskEditController.shareTask),
                TaskOperationRows(
                    icon: Icons.calendar_month_outlined,
                    text: "Calendar",
                    onPressed: () {}),
                TaskOperationRows(
                    icon: Icons.delete_outline,
                    text: "Delete Task",
                    onPressed: taskEditController.showDeleteDialog,
                    iconColor: Colors.red,
                    textColor: Colors.red),
              ],
            ),
            const SizedBox(height: 35),
            EditTaskButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton EditTaskButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width - 70, 50),
            backgroundColor: Palette.primaryColor),
        child: const Text('Edit Task'));
  }
}
