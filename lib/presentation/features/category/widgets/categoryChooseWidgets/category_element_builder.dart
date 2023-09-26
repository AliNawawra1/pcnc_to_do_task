import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants/palette.dart';
import '/domain/entities/category.dart';

class CategoryElementBuilder extends StatelessWidget {
  final Category element;

  const CategoryElementBuilder({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back(result: element);
        Get.snackbar('Success!', 'Category has been selected!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Palette.primaryColor);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: element.color,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Icon(element.icon, size: 50),
          ),
          const SizedBox(height: 16),
          Text(element.name,
              style: const TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }
}
