import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/http_req.dart';
import '../../../utils/rest_api.dart';
import '../../../../widgets/snack_bar_msg.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GroupsController extends GetxController {
  final storage = GetStorage();
  final String url = fetchUserURL();

  getGroups() async {
    var response = await RestAPI().getData(url);
    if (kDebugMode) {
      logger.i(url);
      logger.i(response.body);
    }

    var data = response.body;
    return data;
  }
}
