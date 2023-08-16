import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/groups_controller.dart';

class GroupsPage extends GetView<GroupsController> {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups Page'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.obx(
                (state) => ListView.builder(
                  itemCount: state?.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      state![index].name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(state[index].age.toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
