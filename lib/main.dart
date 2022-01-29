import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_boilerplate/data/local/counter.dart';
import 'package:flutter_boilerplate/data/local/shopping_cart.dart';

import 'package:flutter_boilerplate/views/home.dart';
import 'package:flutter_boilerplate/views/second_page.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}
