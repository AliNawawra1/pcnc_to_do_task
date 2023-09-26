import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/date_time_controller.dart';
import '../controllers/task_addition_controller.dart';

class AddDateTimeButton extends StatelessWidget {
  AddDateTimeButton({super.key, required this.taskAdditionController});

  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final TaskAdditionController taskAdditionController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.timer_outlined, size: 24),
      onPressed: () async {
        await dateTimeController.selectDate(context);
        taskAdditionController
            .setTaskDate(dateTimeController.getCombinedDateTime());
      },
    );
  }
}
