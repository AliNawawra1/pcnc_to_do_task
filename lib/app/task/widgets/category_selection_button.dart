import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/core/constants/keys/assets_keys.dart';
import '/app/category/screens/choose_category_screen.dart';
import 'package:pcnc_todo_task/app/task/controllers/task_addition_controller.dart';


class CategorySelectionButton extends StatelessWidget {
  final TaskAdditionController taskAdditionController;

  const CategorySelectionButton(
      {super.key, required this.taskAdditionController});

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

        taskAdditionController.setTaskCategory(selectedCategory);
      },
    );
  }
}
