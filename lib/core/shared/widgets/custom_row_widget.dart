import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/palette.dart';


class CustomRowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const CustomRowWidget(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: Get.back,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4)),
              child: const Center(
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Palette.primaryColor, fontSize: 16))),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Palette.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(buttonText,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16))),
            ),
          ),
        ),
      ],
    );
  }
}
