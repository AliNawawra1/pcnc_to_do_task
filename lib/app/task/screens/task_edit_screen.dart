import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import '../widgets/edit_task_widgets/close_edit_button.dart';
import '../widgets/edit_task_widgets/mark_complete_button.dart';
import '../widgets/edit_task_widgets/task_category_edit.dart';
import '../widgets/edit_task_widgets/task_operations.dart';
import '../widgets/edit_task_widgets/task_time_edit.dart';
import '../widgets/edit_task_widgets/title_description_edit_widget.dart';
import '/core/constants/palette.dart';

import '../../../domain/entities/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  final Category category;

  const EditTaskScreen({super.key, required this.task, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CloseEditionButton(), MarkAsCompleteButton()],
            ),
            TitleDescriptionEditWidget(task: task),
            TaskTimeEdit(
                infoText: DateFormat('hh:mm a').format(task.dueDate!),
                onTap: () {}),
            TaskCategoryEdit(category: category, onTap: () {}),
            Column(
              children: [
                const Divider(thickness: 2, height: 30, color: Colors.grey),
                TaskOperationRows(
                    icon: Icons.ios_share_outlined,
                    text: "Share Task",
                    onPressed: () {}),
                TaskOperationRows(
                    icon: Icons.calendar_month_outlined,
                    text: "Calendar",
                    onPressed: () {}),
                TaskOperationRows(
                    icon: Icons.delete_outline,
                    text: "Delete Task",
                    onPressed: () {},
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
