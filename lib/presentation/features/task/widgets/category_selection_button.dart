import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../category/screens/category_choose_screen.dart';
import '../controllers/base_task_controller.dart';
import '/core/constants/keys/assets_keys.dart';

class CategorySelectionButton extends StatelessWidget {
  final BaseTaskController taskController;

  const CategorySelectionButton({super.key, required this.taskController});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        AssetsKeys.getAssetPath(AssetsKeys.TAG_ICON, AssetsKeys.ICONS_SUB),
      ),
      onPressed: () async {
        var selectedCategory = await Get.dialog(CategoriesAlert(
            elements: await categoryController.categoryInteractorImpl
                .getCategories()));

        taskController.setTaskCategory(selectedCategory);
      },
    );
  }
}
