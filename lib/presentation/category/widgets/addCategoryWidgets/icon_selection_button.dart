import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/style_constants.dart';

class IconSelectionButton extends StatelessWidget {
  final Rx<IconData?> selectedIcon;
  final VoidCallback onPressed;

  const IconSelectionButton({
    required this.selectedIcon,
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
      child: Obx(() {
        final icon = selectedIcon.value;
        return icon != null
            ? Icon(icon)
            : const Text('Choose icon from library');
      }),
    );
  }
}
