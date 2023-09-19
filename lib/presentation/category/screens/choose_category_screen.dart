import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/style_constants.dart';

import '../../../domain/entities/category.dart';
import '../../category/controllers/category_controller.dart';
import '../widgets/chooseCategoryWidgets/category_add_button.dart';
import '../widgets/chooseCategoryWidgets/category_element_builder.dart';

class CategoriesAlert extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());
  final List<Category> elements;
  Category? selected;

  Future<Category?> showCategoryAlert(BuildContext context) async {
    selected = await showDialog<Category>(
      context: context,
      builder: (_) => this,
    );
    return selected;
  }

  CategoriesAlert({required this.elements});

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
                  addCategoryButton(context),
                  ...elements.map(
                      (element) => categoryElementBuilder(context, element)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Get.back(result: null);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Palette.primaryColor,
                          textStyle: const TextStyle(fontSize: 16)),
                      child: const Text('Cancel')),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Get.back(
                            result: selected); // Return the selected category
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Palette.primaryColor,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 16)),
                      child: const Text('Choose')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
