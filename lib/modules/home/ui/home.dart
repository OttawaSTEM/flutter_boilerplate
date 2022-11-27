import 'package:flutter/material.dart';

import '../../../core/drawer/ui/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Future _users = HttpService().fetchUsers();

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
                  child: const Text('Counter 0'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter0');
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
                    Navigator.of(context).pushNamed('/counter1');
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
                    Navigator.of(context).pushNamed('/counter2');
                  },
                )),
              )),
            ),
            SizedBox(
              height: 80,
              child: (Center(
                child: (ElevatedButton(
                  child: const Text('Counter 3 Persistent State'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter3');
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
