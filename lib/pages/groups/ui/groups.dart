import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/groups_controller.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const String url = 'http://192.168.1.60:8000/api/users/';
    // final String url = 'https://flutter.ottawastem.com/api/groups/';

    // final Future _users = HttpService().get(url);
    // final Future usersJSON = GroupsController().getGroups();
    // var groupsController = Get.put(GroupProvider());
    var groupsController = Get.put(GroupsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Users List Page'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: groupsController.data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      groupsController.data[index]['name'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                        Text(groupsController.data[index]['age'].toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // body: groupsController.obs(
      //   (data) => Center(
      //     child: ListView.builder(
      //       itemCount: data!.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Card(
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 title: Text(data[index]['name']),
      //                 subtitle: Text(data[index]['age']),
      //                 // leading: CircleAvatar(
      //                 //   backgroundImage:
      //                 //       NetworkImage(data[index]['picture']['thumbnail']),
      //                 // ),
      //               )
      //             ],
      //           ),
      //         );
      //         // return ListTile(
      //         //   title: Text('${data['name']}'),
      //         //   subtitle: Text('${data['age']}'),
      //         //   // onTap: () {
      //         //   //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetails(thisItem['id'].toString())));
      //         //   // },
      //         // );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
