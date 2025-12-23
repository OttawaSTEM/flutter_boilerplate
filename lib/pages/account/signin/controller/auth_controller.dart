import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_boilerplate/constants/sizes.dart';
import 'package:flutter_boilerplate/utils/rest_api.dart';
import 'package:flutter_boilerplate/widgets/snack_bar_msg.dart';
import 'package:flutter_boilerplate/pages/home/ui/home_ui.dart';

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
  final String djangoPasswordResetURL = '${env['BASE_URL']}/api/auth/password/reset/';
  final String djangoRegistrationURL = '${env['BASE_URL']}/api/auth/registration/';
  final String djangoGoogleAuthURL = '${env['BASE_URL']}/api/auth/google/';

  // bool authStatus = false;
  // bool get authStatus => authStatus;
  RxBool authStatus = false.obs;

  void djangoAuth(String url, Object body) async {
    var response = await RestAPI().postData(url, body);
    var data = response.body;

    if (response.isOk) {
      if (data['key'] != null) {
        // Sign in succeed, save Django key token to local storage
        storage.write("token", data['key']);
        authStatus.value = true;
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Sign In'.tr,
          message: 'Sign in succeed.'.tr,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else if (data['email'] != null) {
        // Sign in failed - invalid email, remove token
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Sign In'.tr,
          message: ('Failed'.tr) + (' ') + ('Please enter your valid email.'.tr),
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data['non_field_errors'] != null) {
        // Sign in failed - invalid password, remove token
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Sign In'.tr,
          message: ('Failed'.tr) + (' ') + ('Unable to log in with provided credentials.'.tr),
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data['detail'] == 'Password reset e-mail has been sent.') {
        // Password reset succeed
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Password Reset'.tr,
          message: 'Password reset e-mail has been sent.'.tr,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else if (data['detail'] == 'Verification e-mail sent.') {
        // Registration succeed
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Sig up'.tr,
          message: ('Succeed.'.tr) + (' ') + ('Verification e-mail sent.'.tr),
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
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
    } else if (response.hasError) {
      if (data == null) {
        snackbarMsg(
          title: 'Error',
          message: 'Backend server error, Status Code: ${response.statusText}.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data.containsKey('username')) {
        if (data['username'].contains('A user with that username already exists.')) {
          // Registration failed, user email is already registered
          snackbarMsg(
            title: 'Sig up'.tr,
            message: ('Failed.'.tr) + (' ') + ('A user with that username already exists.'.tr),
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        }
      } else if (data.containsKey('email')) {
        if (data['email'].contains('A user is already registered with this e-mail address.')) {
          // Registration failed, user email is already registered
          snackbarMsg(
            title: 'Sig up'.tr,
            message: 'Failed, A user is already registered with this e-mail address.'.tr,
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        }
      } else {
        snackbarMsg(
          title: 'Error',
          message: 'Unknown error, Status Code: ${response.statusCode}.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    }
  }

  Future<void> googleSignIn() async {
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
          message: 'Google Sign In Failed'.tr,
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
        title: 'Google Si failed'.tr,
        message: e.toString(),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
  }

  void resetPassword({required String email}) async {
    final body = {
      'email': email,
    };
    djangoAuth(djangoPasswordResetURL, body);
  }

  void registration({required String username, required String email, required String password1, required String password2}) async {
    final body = {
      'username': username,
      'email': email,
      'password1': password1,
      'password2': password2,
    };
    djangoAuth(djangoRegistrationURL, body);
  }

  void signIn({required String username, required String password}) async {
    final body = {
      'email': username,
      'password': password,
    };
    djangoAuth(djangoLoginURL, body);
  }

  void signOut(BuildContext context) async {
    Get.dialog(
      AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure to sign out?'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusCircularSize)),
              ),
              elevation: 2.0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () async {
              storage.remove('token');
              await RestAPI().postData(djangoLogoutURL);
              await _googleSignIn.signOut();
              authStatus.value = false;
              Get.back();
              Get.to(() => HomePage());
              snackbarMsg(
                title: 'Logout'.tr,
                message: 'Logout succeed!'.tr,
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 40,
                ),
              );
            },
            child: Text(
              'Sign Out'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}