import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class RestAPI extends GetConnect {
  final String url = 'https://flutter.ottawastem.com/api/groups/';

  Future<dynamic> getData() async {
    logger.i('response.body');
    Response response = await get(url);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        logger.i(response.body);
      }
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> postData() async {
    //body data
    FormData formData = FormData({
      // 'field_name': 'field_value',
      // 'field_name': 'field_value',
    });
    Response response = await post('your_post_api_url', formData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
