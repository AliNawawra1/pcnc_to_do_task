import 'package:flutter/material.dart';
import '/core/constants/icons_and_colors_list.dart';

class ColorsSlider extends StatelessWidget {
  final Color? active;
  final ValueChanged<Color>? onSelect;

  const ColorsSlider({super.key, this.active, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: colorList.map(_builder).toList()));
  }

  Widget _builder(Color e) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
            onTap: () => onSelect?.call(e),
            child: CircleAvatar(
                radius: 20.0,
                backgroundColor: e,
                child: active == e
                    ? const Icon(Icons.check, color: Colors.white)
                    : null)),
      );
}
