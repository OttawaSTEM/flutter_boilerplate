import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/drawer/ui/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 0'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter');
                    // Get.to(() => const CounterPage(title: 'Counter GetX Page'));
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Login Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Users Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/users');
                  },
                )),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
