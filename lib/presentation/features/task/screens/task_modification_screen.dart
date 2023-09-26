import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import '../../../../domain/entities/task.dart';
import '../../../../shared/widgets/custom_elevated_button.dart';
import '../../category/screens/category_choosing_dialog.dart';
import '../controllers/task_editing_controller.dart';
import '../widgets/edit_task_widgets/close_modification_button.dart';
import '../widgets/edit_task_widgets/mark_complete_button.dart';
import '../widgets/edit_task_widgets/task_category_edit.dart';
import '../widgets/edit_task_widgets/task_operations.dart';
import '../widgets/edit_task_widgets/task_date_time_edit.dart';
import '../widgets/edit_task_widgets/task_text_fields_for_modification.dart';

class TaskModificationScreen extends StatelessWidget {
  final Rx<Task> task;
  final Rx<Category> category;

  const TaskModificationScreen(
      {super.key, required this.task, required this.category});

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
                const CloseModificationButton(),
                MarkAsCompletedButton(
                    taskEditController: taskEditController, task: task.value)
              ],
            ),
            TaskTextFieldsForModification(
                task: task, taskEditingController: taskEditController),
            Obx(
              () => TaskDateTimeForEditRow(
                  dateTimeText: taskEditController.taskToEdit.value.dueDate != null
                      ? DateFormat('hh:mm a')
                          .format(taskEditController.taskToEdit.value.dueDate!)
                      : '',
                  onTap: () async {
                    await taskEditController.updateDueDate(context);
                  }),
            ),
            TaskCategoryEditRow(
                category: category,
                onTap: () async {
                  var selectedCategory = await Get.dialog(
                      CategoryChoosingDialog(
                          elements: await categoryController
                              .categoryInteractorImpl
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
            CustomElevatedButton(text: 'Edit Task', onPressed: Get.back),
          ],
        ),
      ),
    );
  }
}
