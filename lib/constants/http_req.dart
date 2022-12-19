import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

final env = dotenv.env;

String djangoAuthURL() {
  if (Platform.isAndroid && kDebugMode) {
    return 'http://${env['WIN_IP']}:8000/api/auth/login/';
  } else if (Platform.isIOS && kDebugMode) {
    return 'http://${env['Mac_IP']}:8000/api/auth/login/';
  } else {
    return 'https://${env['DOMAIN']}/api/auth/login/';
  }
}

String googleAuthURL() {
  if (Platform.isAndroid && kDebugMode) {
    return 'http://${env['WIN_IP']}:8000/api/auth/google/';
  } else if (Platform.isIOS && kDebugMode) {
    return 'http://${env['Mac_IP']}:8000/api/auth/google/';
  } else {
    return 'https://${env['DOMAIN']}/api/auth/google/';
  }
}

String fetchUserURL() {
  if (Platform.isAndroid && kDebugMode) {
    return 'http://${env['WIN_IP']}:8000/api/users/';
  } else if (Platform.isIOS && kDebugMode) {
    return 'http://${env['Mac_IP']}:8000/api/users/';
  } else {
    return 'https://${env['DOMAIN']}/api/users/';
  }
}

// http headers
const Object apiHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

const Object backendHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer val'
};
