import 'package:flutter/material.dart';

import '../../../../shared/widgets/text_field_valdation.dart';
import '../controllers/base_task_controller.dart';

class TaskTextFields extends StatelessWidget {
  final BaseTaskController taskController;

  const TaskTextFields({
    super.key,
    required this.taskController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: taskController.formKey,
        child: Column(
          children: [
            TextFieldValidatorWidget(
                controller: taskController.taskTitleController,
                hintText: 'Task Name'),
            TextFormField(
              controller: taskController.taskDescriptionController,
              maxLines: 3,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Description', border: InputBorder.none),
            ),
          ],
        ));
  }
}
