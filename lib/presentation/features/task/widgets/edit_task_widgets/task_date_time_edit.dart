import 'package:flutter/material.dart';

import '../../../../../core/constants/palette.dart';

class TaskDateTimeForEditRow extends StatelessWidget {
  final String dateTimeText;
  final VoidCallback onTap;

  const TaskDateTimeForEditRow(
      {super.key, required this.dateTimeText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [Icon(Icons.timer), SizedBox(width: 5), Text('Task Time:')],
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Palette.bgSecondaryColor),
            child: Center(child: Text(dateTimeText)),
          ),
        ),
      ],
    );
  }
}
