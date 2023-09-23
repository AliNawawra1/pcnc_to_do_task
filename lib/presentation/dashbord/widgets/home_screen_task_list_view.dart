import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/presentation/dashbord/widgets/home_task_item.dart';

import '../../../domain/entities/task.dart';
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
          Task task = taskListViewController.tasks[index];
          return HomeScreenTaskItem(task: task, controller: taskListViewController);
        },
      );
    });
  }
}
