import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data/groups_provider.dart';
import '../model/groups_model.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final env = dotenv.env;
var logger = Logger();

class GroupsController extends GetxController with StateMixin<List<GroupModel>> {
  final GroupsProvider groupsProvider;
  GroupsController({required this.groupsProvider});

  final String url = '${env['BASE_URL']}/api/groups/';

  @override
  void onInit() {
    getGroups();
    super.onInit();
  }

  void getGroups() {
    groupsProvider.getGroups(url).then((result) {
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

String djangoUserSigninURL() {
  // if (Platform.isAndroid && kDebugMode) {
  //   return 'http://${env['WIN_IP']}:8000/api/auth/login/';
  // } else if (Platform.isIOS && kDebugMode) {
  //   return 'http://${env['MAC_IP']}:8000/api/auth/login/';
  // } else {
  //   return 'https://${env['DOMAIN']}/api/auth/login/';
  // }
  return 'https://${env['MAC_IP']}:8000api/auth/login/';
  // return 'https://flutter.ottawastem.com/api/auth/login/';
}
