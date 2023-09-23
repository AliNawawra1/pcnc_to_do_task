import 'package:flutter/material.dart';
import '/presentation/shared/widgets/text_field_valdation.dart';
import 'package:pcnc_todo_task/app/task/controllers/task_addition_controller.dart';

class TaskTextFields extends StatelessWidget {
  final TaskAdditionController taskAdditionController;

  const TaskTextFields({super.key, required this.taskAdditionController});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: taskAdditionController.formKey,
        child: Column(
          children: [
            TextFieldValidatorWidget(
                controller: taskAdditionController.taskTitleController,
                hintText: 'Task Name'),
            TextField(
              controller: taskAdditionController.taskDescriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Description', border: InputBorder.none),
            ),
          ],
        ));
  }
}
