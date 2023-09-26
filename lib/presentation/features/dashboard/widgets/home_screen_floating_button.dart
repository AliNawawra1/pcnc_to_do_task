import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/palette.dart';
import '../../task/screens/task_addition_screen.dart';

class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: FloatingActionButton(
        backgroundColor: Palette.primaryColor,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
        onPressed: () => Get.bottomSheet(TaskAdditionScreen()),
      ),
    );
  }
}
