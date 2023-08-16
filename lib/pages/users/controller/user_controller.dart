import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/io_client.dart";

import '../../../constants/http_req.dart';
import '../../../constants/timeout.dart';
import '../../../utils/utils.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class UserController extends GetxController {
  final storage = GetStorage();

  Future getUsers() async {
    var data = [];
    String? token = storage.read('token');

    try {
      // Android Let's Encrypt Server,  HandshakeException: Handshake error in client (OS Error: CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake)
      final ioc = HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);

      final response = await http.get(
        Uri.parse(fetchUserURL()),
        headers: {
          HttpHeaders.authorizationHeader: 'Token $token',
        },
      ).timeout(
        const Duration(seconds: httpRequestTimeout),
      );
      data = json.decode(response.body);
      if (kDebugMode) {
        logger.i(data);
      }
    } catch (e) {
      if (kDebugMode) {
        logger.i(e);
      }
      if (e.toString().contains('TimeoutException')) {
        snackbarMsg(
          title: 'Failed!',
          message: 'Unable to connect to server.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    }
    return data;
  }
}
