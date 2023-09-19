import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/category.dart';

Widget categoryElementBuilder(BuildContext context, Category element) {
  return TextButton(
    onPressed: () {
      // categoryController.setSelectedCategory(element);
      Get.back();
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: element.color,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Icon(element.icon, size: 50)),
        const SizedBox(height: 16),
        Text(element.name, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}
