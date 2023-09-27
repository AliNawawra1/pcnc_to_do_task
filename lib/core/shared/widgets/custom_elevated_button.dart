import 'package:flutter/material.dart';

import '../../constants/palette.dart';



class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width - 70, 50),
          backgroundColor: Palette.primaryColor),
      child: Text(text),
    );
  }
}
