import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/presentation/shared/widgets/text_field_valdation.dart';
import '../controllers/category_creation_screen_controller.dart';

import '../widgets/addCategoryWidgets/cancel_addition_button.dart';
import '../widgets/addCategoryWidgets/color_slider_widget.dart';
import '../widgets/addCategoryWidgets/create_category_button.dart';
import '../widgets/addCategoryWidgets/icon_selection_button.dart';
import '../widgets/addCategoryWidgets/icon_selection_dialog.dart';

class CategoryCreationScreen extends StatelessWidget {
  final CategoryCreationScreenController categoryAddScreenController =
      Get.put(CategoryCreationScreenController());

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
                  const Text(
                    'Category name:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      key: categoryAddScreenController.formKey,
                      child: TextFieldValidatorWidget(
                          controller: categoryAddScreenController
                              .categoryNameController,
                          hintText: 'Category name')),
                  const SizedBox(height: 20),
                  const Text(
                    'Category icon:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  IconSelectionButton(
                    onPressed: () {
                      _showIconSelectionDialog(context);
                    },
                    selectedIcon:
                        categoryAddScreenController.selectedIcon.value,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Category color:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ColorsSlider(
                    active: categoryAddScreenController.selectedColor.value,
                    onSelect: categoryAddScreenController.onSelectColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelAdditionButton(),
                  const SizedBox(width: 15),
                  CreateCategoryButton(
                      categoryAddScreenController: categoryAddScreenController),
                ],
              ),
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
            builder: (context) {
              return const IconSelectionDialog();
            });
  }
}
