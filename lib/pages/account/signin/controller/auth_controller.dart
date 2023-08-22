import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/rest_api.dart';
// import '../../../../constants/http_req.dart';
import '../../../../constants/strings.dart';
import '../../../../constants/timeout.dart';
import '../../../home/ui/home.dart';
import '../../../../widgets/snack_bar_msg.dart';

import 'package:flutter/foundation.dart';
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

  Future<void> djangoAuthBak(String djangoAuthURL, Object body) async {
    try {
      if (kDebugMode) {
        logger.i('djangoAuthBak');
        logger.i(djangoAuthURL);
        logger.i(body);
      }

      const dynamic headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      };

      final response = await http
          .post(
            Uri.parse(djangoAuthURL),
            headers: headers,
            body: body,
          )
          .timeout(
            const Duration(seconds: httpRequestTimeout),
          );

      final data = jsonDecode(response.body);
      if (kDebugMode) {
        logger.i(data);
      }

      if (data['key'] != null) {
        storage.write("token", data['key']);
        authStatus.value = true;
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Sign In',
          message: 'Succeed!',
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
          title: 'Sign In',
          message: 'Failed! - $txtSigninValidEmail.',
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
          title: 'Sign In',
          message: 'Failed! - $txtSigninFailed.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    } catch (e) {
      storage.remove('token');
      authStatus.value = false;
      if (e.toString().contains('TimeoutException') && !djangoAuthURL.contains('logout')) {
        snackbarMsg(
          title: 'Sign In',
          message: 'Failed! - Unable to connect to server.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    }
  }

  Future<void> djangoLoginBak({required String username, required String password}) async {
    final body = jsonEncode(
      {
        'email': username,
        'password': password,
      },
    );
    djangoAuthBak(djangoLoginURL, body);
  }

  Future<void> googleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final googleAuth = await result?.authentication;
      if (googleAuth != null) {
        final body = jsonEncode({
          'access_token': googleAuth.accessToken,
        });
        final loginURL = djangoGoogleAuthURL;
        djangoAuthBak(loginURL, body);
      } else {
        storage.write('token', '');
        snackbarMsg(
          title: 'Google Sign Iut',
          message: 'Failed!',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
      logger.i('Login Google successfully');
    } catch (e) {
      storage.write('token', '');
      logger.e(e);
    }
  }

  void djangoLogin({required String username, required String password}) async {
    final payLoad = {
      'email': username,
      'password': password,
    };
    var response = await RestAPI().postData(djangoLoginURL, payLoad);

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
    }
  }
}
