import 'package:flutter/material.dart';

import '../../../../core/constants/palette.dart';

class MarkAsCompleteButton extends StatelessWidget {
  const MarkAsCompleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.editScreenRowButtonsColor),
      child: TextButton(
        onPressed: () {
          // Handle Mark as Complete logic
        },
        child: const Text(
          "Mark as Complete",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
