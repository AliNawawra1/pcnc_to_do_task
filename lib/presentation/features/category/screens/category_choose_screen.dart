import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

import '../../../../domain/entities/category.dart';
import '../controllers/category_controller.dart';
import '../widgets/chooseCategoryWidgets/category_create_button.dart';
import '../widgets/chooseCategoryWidgets/category_element_builder.dart';
import 'category_creation_screen.dart';

final CategoryController categoryController = Get.put(CategoryController());

class CategoriesAlert extends StatelessWidget {
  final List<Category> elements;

  const CategoriesAlert({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Choose Category', style: TextStyle(fontSize: 16)),
            const Divider(thickness: 2),
            SizedBox.fromSize(
              size: Size(MediaQuery.of(context).size.width - 50,
                  MediaQuery.of(context).size.height * 0.65),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height * 0.7),
                children: [
                  const NewCategoryButton(),
                  ...elements
                      .map((element) => CategoryElement(element: element))
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
