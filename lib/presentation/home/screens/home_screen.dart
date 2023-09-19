import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcnc_todo_task/core/constants/app_constants.dart';
import 'package:pcnc_todo_task/core/constants/style_constants.dart';

import '../../../core/constants/keys/assets_keys.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      floatingActionButton: SizedBox(
        width: 64.0,
        height: 64.0,
        child: FloatingActionButton(
          backgroundColor: Palette.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Get.bottomSheet(AddTaskBottomSheetContent());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsKeys.getAssetPath(
                  AssetsKeys.EMPTY_HOME_IMAGE, AssetsKeys.IMAGES_SUB),
            ),
            const SizedBox(height: 50),
            const Text(AppConstants.EMPTY_SCREEN_HINT_1,
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            const Text(AppConstants.EMPTY_SCREEN_HINT_2,
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
