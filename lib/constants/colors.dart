import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // No need to instantiate this class for constants

  static Color primary = Colors.blue.shade300;
  static Color textColor = Colors.white;

  static LinearGradient getGradient(Color colorStart, Color colorEnd) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}