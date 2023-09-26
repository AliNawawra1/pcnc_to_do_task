import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/presentation/features/dashbord/screens/empty_home_screen.dart';
import 'package:pcnc_todo_task/presentation/features/dashbord/screens/home_screen_with_data.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (!homeController.hasData.value) {
        return const EmptyStateScreen();
      } else {
        return RefreshIndicator(
          onRefresh: homeController.refreshTasks,
          child: HomeScreenWithData(homeController: homeController),
        );
      }
    });
  }
}
