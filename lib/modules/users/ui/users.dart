import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

class UserPage extends StatefulWidget {
  final String title;
  const UserPage({super.key, required this.title});

  @override
  State<UserPage> createState() => _UserPageState();
}

// const String url = 'http://192.168.1.60:8000/api/users/';
const String url = 'https://flutter.ottawastem.com/api/groups/';

class _UserPageState extends State<UserPage> {
  // final Future _users = HttpService().get(url);
  final Future _users = UserController().getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _users,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  Map user = users[index];
                  return ListTile(
                    title: Text('${user['name']}'),
                    subtitle: Text('${user['age']}'),
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(thisItem['id'].toString())));
                    // },
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
