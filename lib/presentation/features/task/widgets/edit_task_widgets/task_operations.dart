import 'package:flutter/material.dart';

class TaskOperationRows extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color textColor;

  const TaskOperationRows({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: Icon(icon, color: iconColor), onPressed: onPressed),
        Text(text, style: TextStyle(color: textColor)),
      ],
    );
  }
}
