import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/views/home.dart';
import 'package:flutter_boilerplate/views/second_page.dart';
import 'package:flutter_boilerplate/views/user_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page Title'),
  '/second': (context) => const SecondPage(),
  '/user': (context) => const UserPage(),

  // Auth

  // Backend
};
