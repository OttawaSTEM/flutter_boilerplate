import 'package:flutter/material.dart';

class APIJsonPage extends StatefulWidget {
  const APIJsonPage({super.key, required this.title});

  final String title;

  @override
  State<APIJsonPage> createState() => _APIJsonPageState();
}

const String url = 'http://192.168.1.60:8000/api/users/';

class _APIJsonPageState extends State<APIJsonPage> {
  // final Future _users = HttpService().get(url);
  // final Future _users = HttpService().get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        // future: _users,
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
