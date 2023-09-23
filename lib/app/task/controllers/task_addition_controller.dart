import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/dashbord/controllers/home_screen_controller.dart';
import '/domain/entities/task.dart';
import '/domain/interactors_impl/task_interactor_impl.dart';
import '/domain/entities/category.dart';

class TaskAdditionController extends GetxController {
  TaskAdditionController() : taskInteractorImpl = TaskInteractorImpl();

  final HomeController homeController = Get.find();

  final TaskInteractorImpl taskInteractorImpl;
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rxn<Category> selectedCategory = Rxn<Category>();
  Rx<DateTime> selectedDueDate = DateTime.now().obs;

  bool get _isMissingCategory => selectedCategory.value == null;

  bool _validate() {
    if (!(formKey.currentState?.validate() ?? false)) return false;
    if (_isMissingCategory) {
      Get.defaultDialog(
          title: 'Missing Date/Time or Category',
          middleText: 'Please select an date/time and a Category.',
          textConfirm: 'OK',
          onConfirm: Get.back);
      return false;
    }

    return true;
  }

  void onAdd() async {
    if (!_validate()) return;
    final title = taskTitleController.text.trim();
    final description = taskDescriptionController.text;
    final dueDate = selectedDueDate.value;
    final creationDate = DateTime.now();
    final categoryId = selectedCategory.value!.id;

    final task = Task(
      title: title,
      description: description,
      dueDate: dueDate,
      creationDate: creationDate,
      categoryId: categoryId!,
    );
    await taskInteractorImpl.insertTask(task);

    homeController.loadTasks();

    clearAll();
    Get.back();
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
