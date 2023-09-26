import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_addition_controller.dart';
import '../widgets/category_selection_button.dart';
import '../widgets/date_time_selection_button.dart';
import '../widgets/task_text_fields_for_add_and_edit.dart';
import '/core/constants/palette.dart';

class TaskAdditionScreen extends StatelessWidget {
  final TaskAdditionController taskAdditionController =
      Get.put(TaskAdditionController());

  TaskAdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Palette.bgSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Add Task',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 20),
              TaskTextFieldsForAddAndEdit(
                  taskController: taskAdditionController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddDateTimeButton(
                          taskAdditionController: taskAdditionController),
                      const SizedBox(width: 10),
                      CategorySelectionButton(
                          taskController: taskAdditionController),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.send_outlined,
                        color: Palette.primaryColor, size: 24),
                    onPressed: () => taskAdditionController.onAdd(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
