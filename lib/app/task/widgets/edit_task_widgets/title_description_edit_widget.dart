import 'package:flutter/material.dart';

import '../../../../domain/entities/task.dart';

class TitleDescriptionEditWidget extends StatelessWidget {
  final Task task;

  const TitleDescriptionEditWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Handle edit title logic
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(task.description!,
            style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
