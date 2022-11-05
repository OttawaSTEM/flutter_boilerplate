import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kDebugMode;

final logger = Logger();

class HTTPClient {
  var client = http.Client();

  Future<Map> get() async {
    try {
      var response = await client.post(Uri.https('example.com', 'whatsit/create'), body: {'name': 'doodle', 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      return {'uri': uri};
      // print(await client.get(uri));
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
      return {};
    } finally {
      client.close();
    }
  }

  Future<Map> post() async {
    try {
      var response = await client.post(Uri.https('example.com', 'whatsit/create'), body: {'name': 'doodle', 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      return {'uri': uri};
      // print(await client.get(uri));
    } catch (e) {
      if (kDebugMode) {
        logger.e(e.toString());
      }
      return {};
    } finally {
      client.close();
    }
  }
}
