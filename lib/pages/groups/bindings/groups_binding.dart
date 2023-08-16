import 'package:get/get.dart';

import '../controller/groups_controller.dart';
import '../data/groups_provider.dart';

class GroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupsProvider());
    Get.put(GroupsController(groupsProvider: Get.find()));
  }
}
