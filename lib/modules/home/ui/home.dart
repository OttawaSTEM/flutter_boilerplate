import 'package:flutter/material.dart';

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
      // drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
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
                  child: const Text('Counter2 Bloc'),
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
                  child: const Text('Counter3 Persistent State'),
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
                  child: const Text('Weather Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/weather');
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
