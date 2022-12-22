import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../constants/http_req.dart';
import '../../../constants/strings.dart';

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

  String _authMessage = '';
  String get authMessage => _authMessage;

  Future<void> djangoLogin(String loginURL, Object body) async {
    var client = http.Client();
    try {
      const dynamic headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      };

      final response = await client.post(Uri.parse(loginURL), headers: headers, body: body);
      final data = jsonDecode(response.body);
      if (data['key'] != null) {
        storage.write("token", data['key']);
        _authMessage = txtLoginSucess;
        _authStatus = true;
        Get.to(() => const HomePage(title: 'Home Page'));
      } else if (data['email'] != null) {
        storage.remove('token');
        _authMessage = txtLoginValidEmail;
        _authStatus = false;
      } else if (data['non_field_errors'] != null) {
        storage.remove('token');
        _authMessage = txtLoginFailed;
        _authStatus = false;
      }
    } catch (e) {
      storage.remove('token');
      _authStatus = false;
      _authMessage = e.toString();
    } finally {
      client.close();
    }
  }

  Future<void> usernameLogin({required String username, required String password}) async {
    final body = jsonEncode({
      'email': username,
      'password': password,
    });
    final loginURL = djangoUserAuthURL();
    djangoLogin(loginURL, body);
  }

  Future<void> googleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final googleAuth = await result?.authentication;
      if (googleAuth != null) {
        Get.snackbar(
          'Google Signin',
          'Succeed!',
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        final body = jsonEncode({
          'access_token': googleAuth.accessToken,
        });
        final loginURL = djangoGoogleAuthURL();
        djangoLogin(loginURL, body);
      } else {
        storage.write('token', '');
        Get.snackbar(
          'Google Signin',
          'Failed!',
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      storage.write('token', '');
    }
  }

  Future<void> googleSignOut() async {
    Get.dialog(
      AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure to sign out?'),
        actions: [
          ElevatedButton(
            child: const Text("Sign Out"),
            onPressed: () {
              storage.write('token', '');
              _googleSignIn.disconnect();
              _authStatus = false;
              Get.back();
              Get.snackbar(
                'Google Signout',
                'Sucussed!',
                backgroundColor: Colors.black87,
                colorText: Colors.white,
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.green,
                ),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
              );
            },
          ),
        ],
      ),
    );
  }
}
