import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

class DateTimeController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      await selectTime(context);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      Get.snackbar(
          'Success!', // title
          'Date/Time has been selected!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Palette.primaryColor);
    }
  }

  DateTime getCombinedDateTime() {
    final selectedDateTime = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    );
    return selectedDateTime;
  }

  void updateSelectedDateTime(DateTime dateTime) {
    selectedDate.value = DateTime(dateTime.year, dateTime.month, dateTime.day);
    selectedTime.value =
        TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  void resetDateTime() {
    selectedDate.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();
  }
}
