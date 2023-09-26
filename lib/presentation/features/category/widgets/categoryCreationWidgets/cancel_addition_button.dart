import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants/palette.dart';

class CancelAdditionButton extends StatelessWidget {
  const CancelAdditionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Palette.primaryColor,
        ),
        child: const Text('Cancel'),
      ),
    );
  }
}
