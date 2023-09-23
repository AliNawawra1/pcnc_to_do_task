import 'package:flutter/material.dart';
import '../../../../core/constants/palette.dart';
import '../../controllers/category_creation_screen_controller.dart';

class CreateCategoryButton extends StatelessWidget {
  final CategoryCreationScreenController categoryAddScreenController;

  const CreateCategoryButton(
      {super.key, required this.categoryAddScreenController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: categoryAddScreenController.onAdd,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Palette.primaryColor),
        child: const Text('Create Category'),
      ),
    );
  }
}
