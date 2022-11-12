import 'package:flutter/material.dart';

Color primary = Colors.blue.shade400;
Color textColor = Colors.white;
Color dividerColor = Colors.black54;

LinearGradient getGradient(Color colorStart, Color colorEnd) {
  return LinearGradient(
    colors: [colorStart, colorEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
