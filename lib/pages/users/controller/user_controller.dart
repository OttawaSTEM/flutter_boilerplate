import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_boilerplate/pages/home/ui/home_ui.dart';
import 'package:flutter_boilerplate/utils/rest_api.dart';
import 'package:flutter_boilerplate/widgets/snack_bar_msg.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

class UserController extends GetxController {
  final storage = GetStorage();

  final String url = '${env['BASE_URL']}/api/users/';

  Future<dynamic> getUsers() async {
    String? token = storage.read('token');

    var response = await RestAPI().getData(url, token);

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
      Get.to(() => HomePage());
    }
  }
}
