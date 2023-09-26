import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/presentation/features/dashboard/widgets/home_task_item.dart';

import '../controllers/home_task_list_view_controller.dart';

class HomeScreenTaskListView extends StatelessWidget {
  final HomeScreenTaskListViewController taskListViewController;

  const HomeScreenTaskListView(
      {super.key, required this.taskListViewController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: taskListViewController.tasks.length,
        itemBuilder: (context, index) {
          var task = (taskListViewController.tasks[index]).obs;
          return HomeScreenTaskItem(
              task: task,
              homeScreenTaskListViewController: taskListViewController);
        },
      );
    });
  }
}
