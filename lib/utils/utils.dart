import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger();

/// Helper class for device related operations.
class DeviceUtils {
  /// hides the keyboard if its already open
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// accepts a double [scale] and returns scaled sized based on the screen orientation
  static double getScaledSize(BuildContext context, double scale) => scale * (MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height);

  /// accepts a double [scale] and returns scaled sized based on the screen width
  static double getScaledWidth(BuildContext context, double scale) => scale * MediaQuery.of(context).size.width;

  /// accepts a double [scale] and returns scaled sized based on the screen height
  static double getScaledHeight(BuildContext context, double scale) => scale * MediaQuery.of(context).size.height;
}

double screenPosition(dynamic axis, double position) {
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

bool validateEmail(String value) {
  return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
}

Future<String> detectOS() async {
  var platformName = '';

  if (kIsWeb) {
    platformName = 'Web';
  } else {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      platformName = androidDeviceInfo.systemFeatures.contains('android.software.leanback') ? 'Android TV' : 'Android';
    } else if (Platform.isIOS) {
      platformName = 'IOS';
    } else if (Platform.isLinux) {
      platformName = 'Linux';
    } else if (Platform.isMacOS) {
      platformName = 'MacOS';
    } else if (Platform.isWindows) {
      platformName = 'Windows';
    } else {
      platformName = 'Unknown';
    }
  }

  if (kDebugMode) {
    logger.i('Platform: $platformName');
  }
  return (platformName.toString());
}
