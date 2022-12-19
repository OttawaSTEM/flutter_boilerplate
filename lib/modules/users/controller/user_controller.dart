import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../constants/http_req.dart';

class UserController extends GetxController {
  final storage = GetStorage();
  final logger = Logger();

  Future getUsers() async {
    var data = [];
    String? token = storage.read('token');
    logger.i(token);
    logger.i(token);

    try {
      final response = await http.get(Uri.parse(fetchUserURL()), headers: {
        HttpHeaders.authorizationHeader: 'Token $token',
      });
      data = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
    return data;
  }
}
