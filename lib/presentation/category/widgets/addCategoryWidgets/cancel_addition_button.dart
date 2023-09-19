import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/style_constants.dart';

class CancelAdditionButton extends StatelessWidget {
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
