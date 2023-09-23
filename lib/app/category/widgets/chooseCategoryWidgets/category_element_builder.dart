import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/domain/entities/category.dart';

class CategoryElement extends StatelessWidget {
  final Category element;

  const CategoryElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back(result: element);
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
            child: Icon(element.icon, size: 50),
          ),
          const SizedBox(height: 16),
          Text(
            element.name,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
