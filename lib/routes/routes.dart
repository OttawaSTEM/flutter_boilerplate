import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/modules/home/ui/home.dart';
import 'package:flutter_boilerplate/core/auth/ui/login.dart';
import 'package:flutter_boilerplate/modules/second_page/ui/second_page.dart';
// import 'package:flutter_boilerplate/views/pages/user_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: appName),
  '/login': (context) => const LoginPage(),

  '/second': (context) => const SecondPage(),
  // '/user': (context) => const UserPage(),

  // Auth

  // Backend
};
