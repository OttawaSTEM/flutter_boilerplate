import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/http_req.dart';
import '../../../constants/timeout.dart';

class UserController extends GetxController {
  final storage = GetStorage();

  Future<void> snackbarMsg({required String title, required String message}) async {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: snackbarMsgTimeout),
    );
  }

  Future getUsers() async {
    var data = [];
    String? token = storage.read('token');

    try {
      final response = await http.get(
        Uri.parse(fetchUserURL()),
        headers: {
          HttpHeaders.authorizationHeader: 'Token $token',
        },
      ).timeout(
        const Duration(seconds: httpRequestTimeout),
      );
      data = json.decode(response.body);
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        snackbarMsg(title: 'Failed!', message: 'Unable to connect to server.');
      }
    }
    return data;
  }
}
