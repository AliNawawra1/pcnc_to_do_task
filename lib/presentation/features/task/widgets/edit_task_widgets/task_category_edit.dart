import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/palette.dart';
import '../../../../../domain/entities/category.dart';

class TaskCategoryEditRow extends StatelessWidget {
  final Category? category;
  final VoidCallback onTap;

  const TaskCategoryEditRow(
      {super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Row(
        children: [
          Icon(Icons.label),
          SizedBox(width: 5),
          Text('Task Category:'),
        ],
      ),
      InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Palette.bgSecondaryColor),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Icon(category?.icon ?? Icons.add),
            Text(category?.name ?? '',
                style: const TextStyle(color: Colors.white)),
          ]),
        ),
      ),
    ]);
  }
}
