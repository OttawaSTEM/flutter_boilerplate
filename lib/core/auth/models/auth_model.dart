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
    try {
      final response = await http.get(Uri.parse(authUrl));
      Object data = json.decode(response.body);
      logger.d(data);
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
  }
}

  //   Future post() async {
  //   return data;
  // }

// class Counter0Model with ChangeNotifier {
//   int _counter = 0;

//   int get counter => _counter;

//   set counter(int value) {
//     if (value != _counter) {
//       _counter = value;
//       notifyListeners();
//     }
//   }

//   void increment() {
//     _counter += 5;
//     notifyListeners();
//   }
// }
