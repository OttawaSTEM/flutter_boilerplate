import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/views/pages/home.dart';
import 'package:flutter_boilerplate/views/pages/login.dart';
import 'package:flutter_boilerplate/views/pages/second_page.dart';
import 'package:flutter_boilerplate/views/pages/user_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: appName),
  '/second': (context) => const SecondPage(),
  '/user': (context) => const UserPage(),
  '/login': (context) => const LoginPage(),

  // Auth

  // Backend
};
