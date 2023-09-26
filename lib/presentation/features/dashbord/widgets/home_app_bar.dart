import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/app_constants.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

import '../controllers/home_screen_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int taskCount;
  final HomeController homeController = Get.find<HomeController>();

  HomeAppBar({super.key, this.taskCount = 0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.bgColor,
      automaticallyImplyLeading: false,
      title: const Text(AppConstants.HOME),
      centerTitle: true,
      leadingWidth: 80,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Obx(() => Text('Tasks ${homeController.taskCount.value}',
                style: const TextStyle(fontSize: 20))),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_month_outlined),
          onPressed: homeController.openCalendar,
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
