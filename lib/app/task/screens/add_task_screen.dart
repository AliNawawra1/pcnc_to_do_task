import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/app/task/controllers/task_addition_controller.dart';
import 'package:pcnc_todo_task/app/task/widgets/category_selection_button.dart';
import 'package:pcnc_todo_task/app/task/widgets/date_time_selection_button.dart';
import 'package:pcnc_todo_task/app/task/widgets/task_text_fields.dart';

import '/core/constants/palette.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final TaskAdditionController taskAdditionController =
      Get.put(TaskAdditionController());

  AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Palette.bgSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TaskTextFields(taskAdditionController: taskAdditionController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateTimeButton(
                          taskAdditionController: taskAdditionController),
                      const SizedBox(width: 10),
                      CategorySelectionButton(
                          taskAdditionController: taskAdditionController),
                    ],
                  ),
                  IconButton(
                      icon: const Icon(Icons.send_outlined,
                          color: Palette.primaryColor, size: 24),
                      onPressed: () {
                        taskAdditionController.onAdd();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
