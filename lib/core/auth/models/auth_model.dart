import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../constants/http_req.dart';

class AuthModel with ChangeNotifier {
  final logger = Logger();
  // final Logger logger;
  // AuthModel(this.logger);

  String _token = '';
  String get token => _token;
  set token(String value) {
    if (value != _token) {
      _token = value;
      notifyListeners();
    }
  }

  bool _authStatus = false;
  bool get authStatus => _authStatus;
  set authStatus(bool value) {
    if (value != _authStatus) {
      _authStatus = value;
      notifyListeners();
    }
  }

  Future<void> login({required String username, required String password}) async {
    var client = http.Client();
    try {
      const dynamic headers = {
        'Accept': '*/*',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'username': '',
        'email': username,
        'password': password,
      });

      final response = await client.post(Uri.parse(authUrl), headers: headers, body: body);

      final data = jsonDecode(response.body);
      if (data['key'] != null) {
        logger.i(data['key']);
        _token = data['key'];
      } else if (data['email'] != null) {
        logger.i(data);
      } else if (data['non_field_errors'] != null) {
        logger.i(data);
      }
      logger.i(data);
    } catch (e) {
      logger.e(e.toString());
    } finally {
      client.close();
    }
  }
}
