import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

import 'package:flutter_boilerplate/pages/home/ui/home_ui.dart';
import 'package:flutter_boilerplate/utils/rest_api.dart';
import 'package:flutter_boilerplate/widgets/snack_bar_msg.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

class GroupsController extends GetxController {
  // final storage = GetStorage();
  final String url = '${env['BASE_URL']}/api/groups/';
  var groupList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

  Future<dynamic> getGroups() async {
    try {
      isLoading(true);
      var response = await RestAPI().getData(url);
      if (kDebugMode) {
        logger.i(url);
        // logger.i(response.body);
        // logger.i(response.hasError);
        // logger.i(response.status);
        // logger.i(response.statusCode);
      }

      if (!response.hasError) {
        groupList.value = response.body;
      } else {
        snackbarMsg(
          title: 'Get groups error'.tr,
          message: '${response.statusText}',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
        Get.to(() => HomePage());
      }
    } finally {
      isLoading(false);
    }
  }
}
