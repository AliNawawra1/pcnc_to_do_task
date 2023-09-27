import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import '../../../../core/shared/widgets/custom_elevated_button.dart';
import '../../../../domain/entities/task.dart';
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
    final TaskEditingController taskEditingController =
        Get.put(TaskEditingController(task));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CloseModificationButton(),
                    MarkAsCompletedButton(
                        taskEditController: taskEditingController,
                        task: task.value)
                  ],
                ),
                TaskTextFieldsForModification(
                    task: task, taskEditingController: taskEditingController),
                TaskDateTimeForEditRow(
                    dateTimeText:
                        taskEditingController.taskToEdit.value.dueDate != null
                            ? DateFormat('hh:mm a').format(
                                taskEditingController.taskToEdit.value.dueDate!)
                            : '',
                    onTap: () async {
                      await taskEditingController.updateDueDate(context);
                    }),
                TaskCategoryEditRow(
                    category: taskEditingController.selectedCategory.value,
                    onTap: () => _chooseAndSetCategory(taskEditingController)),
                Column(
                  children: [
                    const Divider(thickness: 2, height: 30, color: Colors.grey),
                    TaskOperationRows(
                        icon: Icons.ios_share_outlined,
                        text: "Share Task",
                        onPressed: taskEditingController.shareTask),
                    TaskOperationRows(
                        icon: Icons.calendar_month_outlined,
                        text: "Calendar",
                        onPressed: () {}),
                    TaskOperationRows(
                        icon: Icons.delete_outline,
                        text: "Delete Task",
                        onPressed: taskEditingController.showDeleteDialog,
                        iconColor: Colors.red,
                        textColor: Colors.red),
                  ],
                ),
                const SizedBox(height: 35),
                CustomElevatedButton(text: 'Edit Task', onPressed: Get.back),
              ],
            )),
      ),
    );
  }

  Future<void> _chooseAndSetCategory(
      TaskEditingController taskEditingController) async {
    var selectedCategory = await Get.dialog(CategoryChoosingDialog(
        elements:
            await categoryController.categoryInteractorImpl.getCategories()));
    taskEditingController
      ..setTaskCategory(selectedCategory)
      ..updateCategory();
  }
}
