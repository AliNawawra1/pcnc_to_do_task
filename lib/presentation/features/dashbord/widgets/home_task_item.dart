import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/palette.dart';
import '../../../../domain/entities/task.dart';
import '../../task/screens/task_edit_screen.dart';
import '../controllers/home_task_list_view_controller.dart';

class HomeScreenTaskItem extends StatelessWidget {
  final Rx<Task> task;
  final HomeScreenTaskListViewController homeScreenTaskListViewController;

  HomeScreenTaskItem({
    super.key,
    required this.task,
    required this.homeScreenTaskListViewController,
  }) {
    homeScreenTaskListViewController.loadCategory(task.value.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final category =
          homeScreenTaskListViewController.categoryCache[task.value.categoryId];
      if (category == null) return const CircularProgressIndicator();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: InkWell(
          onTap: () {
            if (category != null) {
              Get.to(() => EditTaskScreen(task: task, category: category));
            } else {
              Get.dialog(buildAlertDialog());
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Palette.bgSecondaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                ListTile(
                  leading: Checkbox(
                    value: task.value.isCompleted,
                    onChanged: (bool? newValue) {
                      homeScreenTaskListViewController
                          .toggleTaskCompletion(task.value);
                    },
                  ),
                  title: Text(task.value.title),
                  subtitle: Text(task.value.dueDate != null
                      ? DateFormat('yyyy/MM/dd ').format(task.value.dueDate!)
                      : 'No Due Date'),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                        color: category.value.color,
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(category.value.icon),
                          Text(category.value.name,
                              style: const TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: const Text('Error'),
      content: const Text('Category is null.'),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
