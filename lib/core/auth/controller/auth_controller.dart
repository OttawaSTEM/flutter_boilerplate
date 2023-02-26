import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../constants/http_req.dart';
import '../../../constants/strings.dart';
import '../../../constants/timeout.dart';
import '../../../utils/utils.dart';

import '../../../modules/home/ui/home.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class AuthController extends GetxController {
  final storage = GetStorage();

  bool _authStatus = false;
  bool get authStatus => _authStatus;

  Future<void> djangoAuth(String djangoAuthURL, Object body) async {
    try {
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
      if (data['key'] != null) {
        storage.write("token", data['key']);
        _authStatus = true;
        Get.to(() => const HomePage(title: 'Home Page'));
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
        _authStatus = false;
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
        _authStatus = false;
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
      _authStatus = false;
      if (e.toString().contains('TimeoutException') &&
          !djangoAuthURL.contains('logout')) {
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

  Future<void> usernameSignin(
      {required String username, required String password}) async {
    final body = jsonEncode({
      'email': username,
      'password': password,
    });
    djangoAuth(djangoUserSigninURL(), body);
  }

  Future<void> googleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final googleAuth = await result?.authentication;
      if (googleAuth != null) {
        final body = jsonEncode({
          'access_token': googleAuth.accessToken,
        });
        final loginURL = djangoGoogleAuthURL();
        djangoAuth(loginURL, body);
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
    } catch (e) {
      storage.write('token', '');
    }
  }

  Future<void> signOut() async {
    final body = jsonEncode({});
    Get.dialog(
      AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure to sign out?'),
        actions: [
          ElevatedButton(
            child: const Text("Sign Out"),
            onPressed: () {
              storage.write('token', '');
              djangoAuth(djangoUserSignOutURL(), body);
              _googleSignIn.disconnect();
              _authStatus = false;
              Get.back();
              snackbarMsg(
                title: 'Sign Out',
                message: 'Sucussed!',
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 40,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
