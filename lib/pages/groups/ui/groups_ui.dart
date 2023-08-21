import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/groups_controller.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final Future controller = GroupsController().getGroups();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups Page'.tr),
      ),
      body: FutureBuilder(
        future: controller,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final groups = snapshot.data;
            return ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                Map group = groups[index];
                return ListTile(
                  title: Text('${group['name']}'),
                  subtitle: Text('${group['age']}'),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(thisItem['id'].toString())));
                  // },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // controller.sendPost();
        },
      ),
    );
  }
}
