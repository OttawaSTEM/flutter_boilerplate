import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade200,
      primary: Colors.grey.shade700,
      secondary: Colors.grey.shade100,
      // inversePrimary: Colors.grey.shade800,
      // inverseSurface: Colors.grey.shade900,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.white,
      secondary: Colors.grey.shade700,
      // inversePrimary: Colors.grey.shade800,
      // inverseSurface: Colors.grey.shade900,
    ));
