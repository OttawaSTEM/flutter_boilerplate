import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/constants/timeout.dart';

Future<void> snackbarMsg({required String title, required String message, required Icon icon}) async {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    icon: icon,
    snackPosition: SnackPosition.bottom,
    duration: const Duration(seconds: snackbarMsgTimeout),
    padding: const EdgeInsets.fromLTRB(30, 20, 10, 20),
    margin: const EdgeInsets.all(20),
  );
}
