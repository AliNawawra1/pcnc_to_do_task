import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pcnc_todo_task/core/constants/keys/assets_keys.dart';
import 'package:pcnc_todo_task/core/constants/style_constants.dart';
import 'package:pcnc_todo_task/presentation/commonControllers/task_controller.dart';
import 'package:pcnc_todo_task/presentation/home/test/date_test.dart';

import '../../category/controllers/category_controller.dart';
import '../../category/screens/choose_category_screen.dart';
import '../../shared/widgets/text_field_valdation.dart';

class AddTaskBottomSheetContent extends StatelessWidget {
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final TaskController taskController = Get.put(TaskController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    taskController.taskNameController.dispose();
    taskController.taskDescriptionController.dispose();
  }

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
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldValidatorWidget(
                        controller: taskController.taskNameController,
                        hintText: 'Task Name',
                      ),
                      TextField(
                        controller: taskController.taskDescriptionController,
                        maxLines: 3, // Multiline for description
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.timer_outlined, size: 24),
                        onPressed: () async {
                          await dateTimeController.selectDate(context);
                          // Store the selected date in TaskController
                          taskController.setTaskDate(
                              dateTimeController.selectedDate.value);
                        },
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: SvgPicture.asset(
                          AssetsKeys.getAssetPath(
                              AssetsKeys.TAG_ICON, AssetsKeys.ICONS_SUB),
                        ),
                        onPressed: () async {
                          final CategoryController categoryController =
                              Get.put(CategoryController());
                          Get.to(() => CategoriesAlert(
                                elements: categoryController.categories,
                              ));
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.send_outlined,
                        color: Palette.primaryColor, size: 24),
                    onPressed: () async {
                      // final taskName = taskNameController.text;
                      // final taskDescription = taskDescriptionController.text;
                      // final dueDate = dateTimeController.selectedDate.value;
                      // final selectedCategory =
                      //     categoryController.selectedCategory.value;
                      //
                      // // Create a Task object using user input
                      // final newTask = Task(
                      //   title: taskName,
                      //   description: taskDescription,
                      //   dueDate: dueDate,
                      //   categoryId: selectedCategory?.id ?? 0,
                      //   creationDate: DateTime.now(),
                      // );
                      //
                      // // Create an instance of the CategoryInteractorImpl
                      // final taskInteractor = TaskInteractorImpl();
                      // final tasks = await taskInteractor.getTasks();
                      // int num = tasks.length;
                      // print("you have $num of tasks");
                      // for (Task task in tasks) {
                      //   print("Task ID: ${task.id}");
                      //   print("Task Name: ${task.title}");
                      //   print("Task Description: ${task.description}");
                      //   print("Task Due Date: ${task.dueDate}");
                      //   print("Task Creation Date: ${task.creationDate}");
                      //   print("Task Category ID: ${task.categoryId}");
                      // }
                      // // Insert the new task into the database
                      // // await taskInteractor.insertTask(newTask);
                      // Get.back();
                      // // Close the bottom sheet or navigate to a different screen if needed
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
