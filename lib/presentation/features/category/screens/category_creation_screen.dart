import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pcnc_todo_task/shared/widgets/custom_row_buttons.dart';
import '../../../../shared/widgets/text_field_valdation.dart';
import '../controllers/category_creation_screen_controller.dart';

import '../widgets/categoryCreationWidgets/category_color_slider_widget.dart';
import '../widgets/categoryCreationWidgets/category_icon_selection_button.dart';
import '../widgets/categoryCreationWidgets/category_icon_selection_dialog.dart';

class CategoryCreationScreen extends StatelessWidget {
  final CategoryCreationController categoryAddScreenController =
      Get.put(CategoryCreationController());

  CategoryCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Create new category',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 25),
                  const Text('Category name:',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 20),
                  Form(
                      key: categoryAddScreenController.formKey,
                      child: TextFieldValidatorWidget(
                          controller: categoryAddScreenController
                              .categoryNameController,
                          hintText: 'Category name')),
                  const SizedBox(height: 20),
                  const Text('Category icon:',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 20),
                  CategoryIconSelectionButton(
                      onPressed: () => _showIconSelectionDialog(context),
                      selectedIcon:
                          categoryAddScreenController.selectedIcon.value),
                  const SizedBox(height: 20),
                  const Text('Category color:',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 20),
                  CategoryColorSlider(
                      active: categoryAddScreenController.selectedColor.value,
                      onSelect: categoryAddScreenController.onSelectColor),
                ],
              ),
              CustomRowButtons(
                  onTap: categoryAddScreenController.onAdd,
                  buttonText: 'Create Category'),
            ],
          );
        }),
      ),
    );
  }

  void _showIconSelectionDialog(BuildContext context) async {
    categoryAddScreenController.selectedIcon.value =
        await showDialog<IconData?>(
            context: context,
            builder: (context) => const CategoryIconSelectionDialog());
  }
}
