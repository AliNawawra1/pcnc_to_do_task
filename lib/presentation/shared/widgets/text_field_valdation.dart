import 'package:flutter/material.dart';

class TextFieldValidatorWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;

  TextFieldValidatorWidget({
    required this.controller,
    required this.hintText,
    this.maxLength = 30,
  });

  String? _validateCategoryName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Category name is required';
    } else if (_containsDisallowedPatterns(value)) {
      return 'Category name contains invalid characters';
    }
    return null; // Input is valid
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Colors.white),
      validator: _validateCategoryName, // Ensure validator is called
    );
  }

  bool _containsDisallowedPatterns(String value) {
    // Define disallowed patterns as a class-level constant list
    final List<Pattern> disallowedPatterns = [r'[!@#$%^&*()]'];

    for (final pattern in disallowedPatterns) {
      final regExp = RegExp(pattern.toString());
      if (regExp.hasMatch(value)) {
        return true;
      }
    }
    return false;
  }
}
