
import 'package:flutter_dotenv/flutter_dotenv.dart';

final env = dotenv.env;

String djangoUserSigninURL() {
  // if (Platform.isAndroid && kDebugMode) {
  //   return 'http://${env['WIN_IP']}:8000/api/auth/login/';
  // } else if (Platform.isIOS && kDebugMode) {
  //   return 'http://${env['Mac_IP']}:8000/api/auth/login/';
  // } else {
  //   return 'https://${env['DOMAIN']}/api/auth/login/';
  // }
  return 'https://flutter.ottawastem.com/api/auth/login/';
}

String djangoUserSignOutURL() {
  // if (Platform.isAndroid && kDebugMode) {
  //   return 'http://${env['WIN_IP']}:8000/api/auth/logout/';
  // } else if (Platform.isIOS && kDebugMode) {
  //   return 'http://${env['Mac_IP']}:8000/api/auth/logout/';
  // } else {
  //   return 'https://${env['DOMAIN']}/api/auth/logout/';
  // }
  return 'https://flutter.ottawastem.com/api/auth/logout/';
}

String djangoGoogleAuthURL() {
  // if (Platform.isAndroid && kDebugMode) {
  //   return 'http://${env['WIN_IP']}:8000/api/auth/google/';
  // } else if (Platform.isIOS && kDebugMode) {
  //   return 'http://${env['Mac_IP']}:8000/api/auth/google/';
  // } else {
  //   return 'https://${env['DOMAIN']}/api/auth/google/';
  // }
  return 'https://flutter.ottawastem.com/api/auth/google/';
}

String fetchUserURL() {
  // if (Platform.isAndroid && kDebugMode) {
  //   return 'http://${env['WIN_IP']}:8000/api/users/';
  // } else if (Platform.isIOS && kDebugMode) {
  //   return 'http://${env['Mac_IP']}:8000/api/users/';
  // } else {
  //   return 'https://${env['DOMAIN']}/api/users/';
  // }
  return 'https://flutter.ottawastem.com/api/groups/';
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
