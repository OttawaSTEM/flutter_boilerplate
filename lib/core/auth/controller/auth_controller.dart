import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../constants/http_req.dart';
import '../../../constants/strings.dart';

import '../../../modules/home/ui/home.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  final logger = Logger();

  bool _authStatus = false;
  bool get authStatus => _authStatus;

  String _authMessage = '';
  String get authMessage => _authMessage;

  Future<void> login(
      {required String username, required String password}) async {
    var client = http.Client();
    try {
      const dynamic headers = {
        'Accept': '*/*',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'email': username,
        'password': password,
      });

      final response =
          await client.post(Uri.parse(authUrl), headers: headers, body: body);
      final data = jsonDecode(response.body);
      logger.i(response.body);
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
      logger.i(_authMessage);
    } finally {
      client.close();
    }
  }

  Future<void> googleLogin() async {
    var client = http.Client();
    try {
      const dynamic headers = {
        'Accept': '*/*',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
        'Content-Type': 'application/json',
      };
      final response =
          await client.post(Uri.parse(googleUrl), headers: headers);
    } catch (e) {
      storage.remove('token');
      logger.i(_authMessage);
    } finally {
      client.close();
    }
  }
}
