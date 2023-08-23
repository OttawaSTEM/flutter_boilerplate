import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../utils/rest_api.dart';
import '../../../home/ui/home.dart';
import '../../../../widgets/snack_bar_msg.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class AuthController extends GetxController {
  final storage = GetStorage();
  final String djangoLoginURL = '${env['BASE_URL']}/api/auth/login/';
  final String djangoLogoutURL = '${env['BASE_URL']}/api/auth/logout/';
  final String djangoSignupURL = '${env['BASE_URL']}/api/auth/signup/';
  final String djangoGoogleAuthURL = '${env['BASE_URL']}/api/auth/google/';

  // bool authStatus = false;
  // bool get authStatus => authStatus;
  RxBool authStatus = false.obs;

  void djangoAuth(String url, Object body) async {
    var response = await RestAPI().postData(url, body);

    if (!response.hasError) {
      var data = response.body;
      if (data['key'] != null) {
        storage.write("token", data['key']);
        authStatus.value = true;
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Login'.tr,
          message: 'Login succeed.'.tr,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else if (data['email'] != null) {
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Login'.tr,
          message: 'Failed, Enter a valid email address.'.tr,
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data['non_field_errors'] != null) {
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Login'.tr,
          message: 'Failed, unable to log in with provided credentials.'.tr,
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
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
      }
    } else if (!response.isOk) {
      snackbarMsg(
        title: 'Error',
        message: 'Backend server error, Status Code: ${response.statusCode}.',
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
  }

  Future<void> googleLogin() async {
    try {
      final result = await _googleSignIn.signIn();
      final googleAuth = await result?.authentication;
      if (googleAuth != null) {
        final body = jsonEncode({
          'access_token': googleAuth.accessToken,
        });
        djangoAuth(djangoGoogleAuthURL, body);
      } else {
        storage.remove('token');
        snackbarMsg(
          title: 'Error'.tr,
          message: 'Google Login failed'.tr,
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    } catch (e) {
      storage.remove('token');
      snackbarMsg(
        title: 'Google Login failed'.tr,
        message: e.toString(),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
  }

  void userLogin({required String username, required String password}) async {
    final body = {
      'email': username,
      'password': password,
    };
    djangoAuth(djangoLoginURL, body);
  }
}
