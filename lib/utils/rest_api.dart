import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class RestAPI extends GetConnect {
  Future<Response> getData(String url, [String? token]) => get(
        url,
        headers: {
          'Authorization': 'Token $token',
        },
      );

  Future<Response> postData(String url, [Map? payload]) => post(
        url,
        payload,
        contentType: 'application/json; charset=UTF-8',
      );

  GetSocket userMessages(String url) {
    return socket(url);
  }
}
