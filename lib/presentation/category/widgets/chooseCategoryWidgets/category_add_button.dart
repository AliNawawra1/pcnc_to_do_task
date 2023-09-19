import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/add_category_screen.dart';

Widget addCategoryButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      Get.to(() => AddCategoryScreen());
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: const BoxDecoration(
              color: Color(0xFF80FFD1),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: const Icon(Icons.add, size: 50)),
        const SizedBox(height: 16),
        const Text('New', style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    ),
  );
}
