import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:flutter_boilerplate/constants/http_req.dart';

class HttpService {
  final logger = Logger();

  Future get([String url = apiBaseUrl]) async {
    var data = [];
    try {
      final response = await http.get(Uri.parse(url));
      data = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
    return data;
  }

  Future post() async {
    var data = [];
    String url = apiBaseUrl;
    try {
      final response = await http.get(Uri.parse(url));
      data = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
    }
    return data;
  }
}
