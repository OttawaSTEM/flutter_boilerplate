import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/rest_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/http_req.dart';
import '../../../constants/timeout.dart';
import '../../../utils/utils.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GroupProvider extends GetConnect {
  final List<Map<String, dynamic>> data = [
    {'name': 'John', 'age': 30},
    {'name': 'Alex', 'age': 29},
    {'name': 'Lucas', 'age': 33},
    {'name': 'Emily', 'age': 40},
    {'name': 'Atom', 'age': 66},
    {'name': 'Atom', 'age': 66}
  ].obs;

  // Future<Response> getGroups() =>
  //     get('https://flutter.ottawastem.com/api/groups/');
}

// class GroupsController extends GetxController {
//   final storage = GetStorage();


//   // var restAPI = Get.put(RestAPI());

//   // var data = [].obs;

//   // getGroups() async {
//   //   try {
//   //     var response = await restAPI.getData();
//   //     data = json.decode(response.body);
//   //     if (kDebugMode) {
//   //       logger.i(data);
//   //     }
//   //   } catch (e) {
//   //     if (kDebugMode) {
//   //       logger.i(e);
//   //     }
//   //     if (e.toString().contains('TimeoutException')) {
//   //       snackbarMsg(
//   //         title: 'Failed!',
//   //         message: 'Unable to connect to server.',
//   //         icon: const Icon(
//   //           Icons.error_outline_outlined,
//   //           color: Colors.red,
//   //           size: 40,
//   //         ),
//   //       );
//   //     }
//   //   }
//   // }

//   @override
//   void onInit() {
//     getGroups();
//     super.onInit();
//   }
// }
