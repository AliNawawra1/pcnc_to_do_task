import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class TextFieldValidatorWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;

  const TextFieldValidatorWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength = 15,
  });

  @override
  TextFieldValidatorWidgetState createState() =>
      TextFieldValidatorWidgetState();
}

class TextFieldValidatorWidgetState extends State<TextFieldValidatorWidget> {
  @override
  void initState() {
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  String? _validateCategoryName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'The name is required';
    } else if (_containsDisallowedPatterns(value)) {
      return 'The name contains invalid characters';
    } else if (_containsInvalidSequence(value)) {
      return 'The name contains invalid sequence';
    }
    return null;
  }

  bool _containsInvalidSequence(String value) {
    // This regular expression matches three specific sequences: '123', 'abc', 'xyz'.
    final sequenceRegExp = RegExp(r'(123|abc|xyz)');
    // This regular expression matches any character (.) followed by the same character (\1) two or more times (+).
    final repeatedCharRegExp = RegExp(r'(\d)\1{3,}|([a-zA-Z])\2{2,}');

    // Return true if value matches either regular expression.
    return sequenceRegExp.hasMatch(value) || repeatedCharRegExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: widget.controller,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: InputBorder.none,
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(color: Colors.white),
      validator: _validateCategoryName,
      keyboardType: TextInputType.text,
      enableInteractiveSelection: false,
      // To prevent copy paste
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  bool _containsDisallowedPatterns(String value) {
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
