import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/style_constants.dart';
import '../../../../domain/entities/category.dart';
import '../../controllers/category_controller.dart';

class CreateCategoryButton extends StatelessWidget {
  final TextEditingController categoryNameController;
  final CategoryController categoryController;
  final GlobalKey<FormState> formKey;

  const CreateCategoryButton({
    required this.categoryNameController,
    required this.categoryController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            final categoryName = categoryNameController.text;
            final selectedIcon = categoryController.selectedIcon.value;
            final selectedColor = categoryController.selectedColor.value;

            if (selectedIcon == null || selectedColor == null) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Missing Icon or Color'),
                    content: Text('Please select an icon and a color.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.back(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              final newCategory = Category(
                name: categoryName,
                icon: selectedIcon,
                color: selectedColor,
              );

              categoryController.addCategory(newCategory);

              Get.back(); // Close the current screen
            }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Palette.primaryColor,
          onPrimary: Colors.white,
        ),
        child: const Text('Create Category'),
      ),
    );
  }
}
