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
                  child: const Text('Counter1 Page'),
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
                  child: const Text('Counter2 Page'),
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
                  child: const Text('Counter3 Page'),
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

      // body: FutureBuilder(
      //   future: _users,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(child: Text('Some error occurred ${snapshot.error}'));
      //     } else if (snapshot.hasData) {
      //       final users = snapshot.data;
      //       return ListView.builder(
      //           itemCount: users.length,
      //           itemBuilder: (context, index) {
      //             Map user = users[index];
      //             return ListTile(
      //               title: Text('${user['name']}'),
      //               subtitle: Text('${user['age']}'),
      //               // onTap: () {
      //               //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(thisItem['id'].toString())));
      //               // },
      //             );
      //           });
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
