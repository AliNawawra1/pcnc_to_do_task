import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/task.dart';
import '../../controllers/task_editing_controller.dart';
import '../../screens/text_fields_modification_screen.dart';

class TaskTextFieldsForModification extends StatelessWidget {
  final Rx<Task> task;
  final TaskEditingController taskEditingController;

  const TaskTextFieldsForModification(
      {super.key, required this.task, required this.taskEditingController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(task.value.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                  icon: const Icon(Icons.edit), onPressed: editIconOnTap),
            ],
          ),
          const SizedBox(height: 10),
          Text(task.value.description!,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      );
    });
  }

  void editIconOnTap() async {
    var newTask = await Get.bottomSheet<Task?>(TextFieldsModificationScreen(
        task: task, taskEditingController: taskEditingController));
    if (newTask != null) {
      taskEditingController.taskTitleController.text = newTask.title;
      taskEditingController.taskDescriptionController.text =
          newTask.description ?? '';
      task.value = newTask;
    }
  }
}
