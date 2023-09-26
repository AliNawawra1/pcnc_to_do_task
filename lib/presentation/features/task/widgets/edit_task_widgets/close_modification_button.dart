import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/palette.dart';

class CloseModificationButton extends StatelessWidget {
  const CloseModificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.editScreenRowButtonsColor),
      child: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: Get.back),
    );
  }
}
