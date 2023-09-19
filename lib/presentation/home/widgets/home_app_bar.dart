import 'package:flutter/material.dart';
import 'package:pcnc_todo_task/core/constants/app_constants.dart';
import 'package:pcnc_todo_task/core/constants/style_constants.dart';

AppBar HomeAppBar() {
  return AppBar(
    backgroundColor: Palette.bgColor,
    automaticallyImplyLeading: false,
    title: const Text(AppConstants.HOME),
    centerTitle: true,
    leadingWidth: 80,
    leading: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Expanded(
          child: Text('Tasks ', style: TextStyle(fontSize: 20)),
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.calendar_month_outlined),
        onPressed: () {},
      ),
      const SizedBox(width: 15),
    ],
  );
}
