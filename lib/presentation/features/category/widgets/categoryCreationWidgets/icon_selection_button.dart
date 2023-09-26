import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

class CategoryIconSelectionButton extends StatelessWidget {
  final IconData? selectedIcon;
  final VoidCallback onPressed;

  const CategoryIconSelectionButton(
      {super.key, this.selectedIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Palette.bgSecondaryColor),
      child: selectedIcon != null
          ? Icon(selectedIcon)
          : const Text('Choose icon from library'),
    );
  }
}
