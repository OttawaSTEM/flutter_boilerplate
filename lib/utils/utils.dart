import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/timeout.dart';

/// Helper class for device related operations.
class DeviceUtils {
  /// hides the keyboard if its already open
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// accepts a double [scale] and returns scaled sized based on the screen orientation
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  /// accepts a double [scale] and returns scaled sized based on the screen width
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  /// accepts a double [scale] and returns scaled sized based on the screen height
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}

Future<void> snackbarMsg(
    {required String title, required String message, required Icon icon}) async {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    icon: icon,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: snackbarMsgTimeout),
    padding: const EdgeInsets.fromLTRB(30, 20, 10, 20),
    margin: const EdgeInsets.all(20),
  );
}

double screenPosition(var axis, double position) {
  // From center of the screen position
  GetStorage storage = GetStorage();
  var screenWidth = storage.read('screeWidth');
  var screenHeight = storage.read('screeHeight');
  var screenHalfHeight = screenHeight / 2;
  var screenHalfWidth = screenWidth / 2;

  if (axis == 'x') {
    return screenHalfWidth + screenHalfWidth * position;
  } else {
    return screenHalfHeight + screenHalfHeight * position;
  }
}
