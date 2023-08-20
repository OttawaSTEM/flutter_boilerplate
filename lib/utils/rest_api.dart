import 'package:get/get.dart';
// import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class RestAPI extends GetConnect {
  Future<Response> getData(String url) => get(url);

  Future<Response> postData(String url, Map data) => post(
        url,
        data,
        contentType: 'application/json; charset=UTF-8',
      );
}
