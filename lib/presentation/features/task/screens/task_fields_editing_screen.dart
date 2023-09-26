import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/entities/task.dart';

import '../../../../core/constants/palette.dart';
import '../../../../shared/widgets/custom_row_buttons.dart';
import '../controllers/task_editing_controller.dart';
import '../widgets/task_text_fields.dart';

class TaskTextFieldsModificationScreen extends StatelessWidget {
  final Rx<Task> task;
  final TaskEditingController taskEditingController;

  const TaskTextFieldsModificationScreen(
      {super.key, required this.task, required this.taskEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Palette.bgSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Edit Task',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TaskTextFields(taskController: taskEditingController),
              CustomRowButtons(
                  buttonText: 'Edit',
                  onTap: taskEditingController.updateTextFields),
            ],
          ),
        ),
      ),
    );
  }
}
