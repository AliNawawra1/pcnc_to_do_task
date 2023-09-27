import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/category.dart';

class BaseTaskController extends GetxController {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rxn<Category> selectedCategory = Rxn<Category>();
  Rx<DateTime> selectedDueDate = DateTime.now().obs;

  bool get isMissingCategory => selectedCategory.value == null;

  bool validate() {
    if (!(formKey.currentState?.validate() ?? false)) return false;
    if (isMissingCategory) {
      Get.defaultDialog(
          title: 'Missing Date/Time or Category',
          middleText: 'Please select an date/time and a Category.',
          textConfirm: 'OK',
          onConfirm: Get.back);
      return false;
    }
    return true;
  }

  void clearAll() {
    taskTitleController.clear();
    taskDescriptionController.clear();
    selectedCategory.value = null;
    selectedDueDate.value = DateTime.now();
  }

  void setTaskDate(DateTime date) {
    selectedDueDate.value = date;
  }

  void setTaskCategory(Category category) {
    selectedCategory.value = category;
  }
}
