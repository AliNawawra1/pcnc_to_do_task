import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/app/task/controllers/date_time_controller.dart';
import 'package:pcnc_todo_task/app/task/controllers/task_addition_controller.dart';

class DateTimeButton extends StatelessWidget {
  DateTimeButton({super.key, required this.taskAdditionController});

  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final TaskAdditionController taskAdditionController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.timer_outlined, size: 24),
      onPressed: () async {
        await dateTimeController.selectDate(context);
        // Store the selected date in TaskController
        taskAdditionController
            .setTaskDate(dateTimeController.getCombinedDateTime());
      },
    );
  }
}
