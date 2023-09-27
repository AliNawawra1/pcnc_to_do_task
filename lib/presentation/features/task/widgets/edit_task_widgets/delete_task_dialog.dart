import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/shared/widgets/custom_row_widget.dart';

class DeleteTaskDialog extends StatelessWidget {
  final String taskTitle;
  final Function onDeleteTap;

  const DeleteTaskDialog(
      {super.key, required this.taskTitle, required this.onDeleteTap});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Center(child: Text("Delete Task")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(thickness: 3, height: 30, color: Colors.white),
            Center(
                child: Text(
                    "Are you sure you want to delete this task? \n\n Task title: $taskTitle",
                    textAlign: TextAlign.center)),
          ],
        ),
        actions: [
          CustomRowWidget(
            buttonText: 'Delete',
            onTap: () {
              onDeleteTap();
              Get.back();
            },
          ),
        ],
      );
}
