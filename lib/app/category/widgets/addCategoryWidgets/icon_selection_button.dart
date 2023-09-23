import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';

class IconSelectionButton extends StatelessWidget {
  final IconData? selectedIcon;
  final VoidCallback onPressed;

  const IconSelectionButton({
    this.selectedIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Palette.bgSecondaryColor,
        onPrimary: Colors.white,
      ),
      child: selectedIcon != null
          ? Icon(selectedIcon)
          : const Text('Choose icon from library'),
    );
  }
}
