import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../constants/http_req.dart';
import '../../../constants/strings.dart';

class AuthModel with ChangeNotifier {
  final storage = const FlutterSecureStorage();

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
      if (data['key'] != null) {
        await storage.write(key: 'token', value: data['key']);
        _authMessage = txtLoginSucess;
        _authStatus = true;
      } else if (data['email'] != null) {
        await storage.delete(key: 'token');
        _authMessage = txtLoginValidEmail;
        _authStatus = false;
      } else if (data['non_field_errors'] != null) {
        await storage.delete(key: 'token');
        _authMessage = txtLoginFailed;
        _authStatus = false;
      }
    } catch (e) {
      await storage.delete(key: 'token');
      _authStatus = false;
    } finally {
      client.close();
    }
    notifyListeners();
  }
}

class True {}
