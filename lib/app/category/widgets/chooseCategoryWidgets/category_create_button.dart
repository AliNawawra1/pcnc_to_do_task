import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/add_category_screen.dart';

class NewCategoryButton extends StatelessWidget {
  const NewCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.isDialogOpen ?? false) Get.back();
        Get.to(() => CategoryCreationScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFF80FFD1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Icon(Icons.add, size: 50)),
          const SizedBox(height: 16),
          const Text('New',
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }
}
