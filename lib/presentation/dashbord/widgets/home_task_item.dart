import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/palette.dart';
import '../../../domain/entities/task.dart';
import '../controllers/home_task_list_view_controller.dart';
import '../../../app/task/screens/task_edit_screen.dart';

class HomeScreenTaskItem extends StatelessWidget {
  final Task task;
  final HomeScreenTaskListViewController controller;

  HomeScreenTaskItem({
    super.key,
    required this.task,
    required this.controller,
  }) {
    controller.loadCategory(task.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final category = controller.categoryCache[task.categoryId];
      if (category == null) return const CircularProgressIndicator();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: InkWell(
          onTap: () {
            Get.to(() => EditTaskScreen(task: task, category: category!));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Palette.bgSecondaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (bool? newValue) {
                      controller.toggleTaskCompletion(task);
                    },
                  ),
                  title: Text(task.title),
                  subtitle: Text(DateFormat('hh:mm a').format(task.dueDate!)),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                        color: category.color,
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(category.icon),
                          Text(category.name,
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
}
