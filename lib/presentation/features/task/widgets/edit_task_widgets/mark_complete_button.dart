import 'package:flutter/material.dart';

import '../../../../../core/constants/palette.dart';
import '../../../../../domain/entities/task.dart';
import '../../controllers/task_editing_controller.dart';

class MarkAsCompleteButton extends StatelessWidget {
  final TaskEditingController taskEditController;
  final Task task;

  const MarkAsCompleteButton(
      {super.key, required this.taskEditController, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.editScreenRowButtonsColor),
      child: TextButton(
        onPressed: () {
          taskEditController.toggleTaskCompletion(task);
        },
        child: const Text(
          "Mark as Complete",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
