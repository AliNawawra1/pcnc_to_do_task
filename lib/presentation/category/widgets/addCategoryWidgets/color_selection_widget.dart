import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorSelectionWidget extends StatelessWidget {
  final List<Color> colorList;
  final Rx<Color?> selectedColor;

  ColorSelectionWidget({
    required this.colorList,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final color in colorList)
            GestureDetector(
              onTap: () {
                selectedColor.value = color;
              },
              child: Obx(() {
                final isSelected = color == selectedColor.value;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _colorEllipse(color),
                    if (isSelected)
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Icon(Icons.check, color: Colors.white),
                      ),
                  ],
                );
              }),
            ),
        ],
      ),
    );
  }

  Widget _colorEllipse(Color color) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
