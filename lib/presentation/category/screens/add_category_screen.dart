import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/icons_and_colors_list.dart';

import 'package:pcnc_todo_task/presentation/category/controllers/category_controller.dart';
import 'package:pcnc_todo_task/presentation/shared/widgets/text_field_valdation.dart';

import '../widgets/addCategoryWidgets/cancel_addition_button.dart';
import '../widgets/addCategoryWidgets/color_selection_widget.dart';
import '../widgets/addCategoryWidgets/create_category_button.dart';
import '../widgets/addCategoryWidgets/icon_selection_button.dart';
import '../widgets/addCategoryWidgets/icon_selection_dialog.dart';


class AddCategoryScreen extends StatelessWidget {
  final TextEditingController _categoryNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  void dispose() {
    _categoryNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
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
                    key: _formKey,
                    child: TextFieldValidatorWidget(
                        controller: _categoryNameController,
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
                  selectedIcon: categoryController.selectedIcon,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Category color:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ColorSelectionWidget(
                  colorList: colorList,
                  selectedColor: categoryController.selectedColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CancelAdditionButton(),
                const SizedBox(width: 15),
                CreateCategoryButton(
                  categoryNameController: _categoryNameController,
                  categoryController: categoryController,
                  formKey: _formKey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showIconSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return IconSelectionDialog(
          iconList: iconList,
          selectedIcon: categoryController.selectedIcon,
        );
      },
    );
  }
}
