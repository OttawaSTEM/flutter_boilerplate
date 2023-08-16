import 'package:get/get.dart';

import '../data/groups_provider.dart';
import '../model/groups_model.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GroupsController extends GetxController with StateMixin<List<GroupModel>> {
  final GroupsProvider groupsProvider;
  GroupsController({required this.groupsProvider});

  @override
  void onInit() {
    getGroups();
    super.onInit();
  }

  void getGroups() {
    groupsProvider.getGroups().then((result) {
      logger.i('GroupsController getGroups()');
      logger.i(result.body);
      List<GroupModel>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void insertGroups() {
    const body = {'nome': 'joao', 'idade': 47};

    groupsProvider.postGroups(body).then((result) {
      if (kDebugMode) {
        logger.i(result.body?.name);
        logger.i(result.body?.age);
      }
    });
  }
}
