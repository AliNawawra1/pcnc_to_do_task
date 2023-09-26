import 'package:flutter/material.dart';

import '../controllers/home_screen_controller.dart';
import '../controllers/home_task_list_view_controller.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_screen_floating_button.dart';
import '../widgets/home_screen_task_list_view.dart';

class HomeScreenWithData extends StatelessWidget {
  final HomeController homeController;

  const HomeScreenWithData({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(taskCount: homeController.taskCount.value),
      floatingActionButton: const HomeScreenFloatingActionButton(),
      body: HomeScreenTaskListView(
          taskListViewController:
              HomeScreenTaskListViewController(homeController)),
    );
  }
}
