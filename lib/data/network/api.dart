import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpService {
  final logger = Logger();

  Future fetchUsers() async {
    var data = [];
    // const String url = 'https://api.json-generator.com/templates/-eZlCwfKSpqC/data?access_token=60p9v6l4cvb874bi65k6vze2bbxuz4e81yyurvym';
    const String url = 'http://localhost:8000/api/users/';
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
