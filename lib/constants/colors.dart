import 'package:flutter/material.dart';

class AppColors {
  static Color primary = Colors.blue.shade300;
  static Color textColor = Colors.white;
  static Color dividerColor = Colors.black54;

  static LinearGradient getGradient(Color colorStart, Color colorEnd) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
