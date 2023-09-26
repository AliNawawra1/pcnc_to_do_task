import 'package:flutter/material.dart';

import '../../../../../core/constants/palette.dart';



class TaskTimeForEdit extends StatelessWidget {
  final String infoText;
  final VoidCallback onTap;

  const TaskTimeForEdit({
    super.key,
    required this.infoText,
    required this.onTap,
  });

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
              color: Palette.bgSecondaryColor,
            ),
            child: Center(
              child: Text(infoText),
            ),
          ),
        ),
      ],
    );
  }
}
