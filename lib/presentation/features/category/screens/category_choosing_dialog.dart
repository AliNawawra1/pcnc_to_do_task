import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

import '../../../../domain/entities/category.dart';
import '../controllers/category_controller.dart';
import '../widgets/categoryChooseWidgets/new_category_item_button.dart';
import '../widgets/categoryChooseWidgets/category_element_builder.dart';
import 'category_creation_screen.dart';

final CategoryController categoryController = Get.put(CategoryController());

class CategoryChoosingDialog extends StatelessWidget {
  final List<Category> elements;

  const CategoryChoosingDialog({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Choose Category', style: TextStyle(fontSize: 16)),
            const Divider(thickness: 2),
            SizedBox.fromSize(
              size: Size(screenWidth - 50, screenHeight * 0.65),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: screenWidth / (screenHeight * 0.7),
                children: [
                  const NewCategoryItemButton(),
                  ...elements.map(
                      (element) => CategoryElementBuilder(element: element))
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    if (Get.isDialogOpen ?? false) Get.back();
                    Get.to(() => CategoryCreationScreen());
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Palette.primaryColor,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 16)),
                  child: const Text('Add Category')),
            ),
          ],
        ),
      ),
    );
  }
}
