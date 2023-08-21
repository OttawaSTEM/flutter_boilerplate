import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../pages/home/ui/home.dart';
import '../../../utils/rest_api.dart';
import '../../../../widgets/snack_bar_msg.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

class UserController extends GetxController {
  final storage = GetStorage();
  final String url = '${env['BASE_URL']}/api/users/';

  getUsers() async {
    var response = await RestAPI().getData(url);
    if (kDebugMode) {
      logger.i(url);
      // logger.i(response.body);
      logger.i(response.hasError);
      logger.i(response.status);
      logger.i(response.statusCode);
    }

    if (!response.hasError) {
      var data = response.body;
      return data;
    } else {
      snackbarMsg(
        title: 'Error'.tr,
        message: '${response.statusText}',
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
      Get.to(() => const HomePage());
    }
  }
}
