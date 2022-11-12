import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/common.dart';
import 'package:flutter_boilerplate/views/pages/home.dart';
import 'package:flutter_boilerplate/views/pages/second_page.dart';
import 'package:flutter_boilerplate/views/pages/user_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => HomePage(title: Common.appName),
  '/second': (context) => const SecondPage(),
  '/user': (context) => const UserPage(),

  // Auth

  // Backend
};
