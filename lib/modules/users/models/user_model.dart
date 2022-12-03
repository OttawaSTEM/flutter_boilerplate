import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../constants/http_req.dart';
import '../../../constants/strings.dart';

import '../../../core/auth/models/auth_model.dart';

class UserModel with ChangeNotifier {
  final logger = Logger();

  // String _authMessage = '';
  // String get authMessage => _authMessage;

  // String _token = '';
  // String get token => _token;
  // set token(String value) {
  //   if (value != _token) {
  //     _token = value;
  //     notifyListeners();
  //   }
  // }

  Future<void> getUsers() async {
    var client = http.Client();
    try {
      // logger.i(Provider.of<AuthModel>().authStatus);
      // const dynamic headers = {
      //   'Accept': '*/*',
      //   'User-Agent':
      //       'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
      //   'Content-Type': 'application/json',
      // };

      // final body = jsonEncode({
      //   'username': '',
      //   'email': username,
      //   'password': password,
      // });

      // final response = await client.post(Uri.parse(authUrl), headers: headers, body: body);
      // final data = jsonDecode(response.body);
      // if (data['key'] != null) {
      //   _token = data['key'];
      //   _authMessage = txtLoginSucess;
      // } else if (data['email'] != null) {
      //   _authMessage = txtLoginValidEmail;
      // } else if (data['non_field_errors'] != null) {
      //   _authMessage = txtLoginFailed;
      // }
      // notifyListeners();
    } catch (e) {
    } finally {
      client.close();
    }
  }
}
