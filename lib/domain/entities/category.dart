import 'package:flutter/material.dart';

class Category {
  int? id;
  final String name;
  final Color color;
  final IconData icon;

  Category({
    this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  // Convert a Category object to a map (for database storage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.value, // Store Color as an integer
      'icon': icon.codePoint, // Store IconData as an integer (code point)
    };
  }

  // Create a Category object from a map (from database)
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      color: Color(map['color']), // Convert integer to Color
      icon: IconData(
        map['icon'],
        fontFamily: 'MaterialIcons',
      ), // Convert integer to IconData
    );
  }
}
