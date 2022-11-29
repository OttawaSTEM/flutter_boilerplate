import 'package:flutter/material.dart';

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
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 0 ChangeNotifier'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter0');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 40,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 1 Shared Perferences'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter1');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter1 Cubit'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter10');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 40,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 2 Bloc'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter20');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 3 Bloc (Persistent State)'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter30');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('API JSON Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/api_json');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 40,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Weather Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/weather');
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
          ],
        ),
      ),
    );
  }
}
