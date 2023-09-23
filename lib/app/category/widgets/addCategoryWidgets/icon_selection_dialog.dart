import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/icons_and_colors_list.dart';

class IconSelectionDialog extends StatelessWidget {
  const IconSelectionDialog({super.key});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select an Icon'),
      content: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 icons per row
          ),
          itemCount: iconList.length,
          itemBuilder: (context, index) {
            final icon = iconList[index];
            return GestureDetector(
              child: Icon(icon),
              onTap: () {
                // selectedIcon = icon;
                Get.back(result: icon);
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
