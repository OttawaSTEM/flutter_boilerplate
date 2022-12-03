import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../constants/http_req.dart';

class UserModel with ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final logger = Logger();

  Future getUsers() async {
    var data = [];
    String? token = await storage.read(key: 'token');
    logger.i(token);

    try {
      final response = await http.get(Uri.parse(userUrl));
      data = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
    return data;
  }
}
