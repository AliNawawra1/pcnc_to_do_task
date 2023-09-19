import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconSelectionDialog extends StatelessWidget {
  final List<IconData> iconList;
  final Rx<IconData?> selectedIcon;

  IconSelectionDialog({
    required this.iconList,
    required this.selectedIcon,
  });

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
                selectedIcon.value = icon;
                Get.back();
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
