import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import 'package:pcnc_todo_task/domain/interactors_impl/category_interactor_impl.dart';

class CategoryCreationScreenController extends GetxController {
  CategoryCreationScreenController()
      : categoryInteractorImpl = CategoryInteractorImpl();

  final TextEditingController categoryNameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final CategoryInteractorImpl categoryInteractorImpl;

  final Rxn<IconData> selectedIcon = Rxn<IconData>();
  final Rxn<Color> selectedColor = Rxn<Color>();

  void onSelectColor(Color color) {
    selectedColor.value = color;
  }

  bool get _missingIconOrColor =>
      selectedIcon.value == null || selectedColor.value == null;

  bool _validate() {
    if (!(formKey.currentState?.validate() ?? false)) return false;
    if (_missingIconOrColor) {
      Get.defaultDialog(
          title: 'Missing Icon or Color',
          middleText: 'Please select an icon and a color.',
          textConfirm: 'OK',
          onConfirm: Get.back);
      return false;
    }

    return true;
  }

  void onAdd() async {
    if (!_validate()) return;

    final name = categoryNameController.text.trim();
    final icon = selectedIcon.value!;
    final color = selectedColor.value!;

    final category = Category(name: name, icon: icon, color: color);
    await categoryInteractorImpl.insertCategory(category);

    Get.back();
  }
}
