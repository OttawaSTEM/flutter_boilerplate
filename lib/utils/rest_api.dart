import 'package:get/get.dart';
// import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class RestAPI extends GetConnect {
  Future<Response> getPosts(String url) => get(url);

  Future<Response> sendPost(String url, Map data) => post(
        url,
        data,
        contentType: 'application/json; charset=UTF-8',
      );
}

// class RestAPI extends GetConnect {
//   Future<Response?> getData(String url) async {
//     Response response = await get(url);
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         logger.i(response.body);
//       }
//       return response.body;
//     } else {
//       return null;
//     }
//   }

//   Future<Response> postData(String url) async {


//     //body data
//     FormData formData = FormData({
//       // 'field_name': 'field_value',
//       // 'field_name': 'field_value',
//     });
//     Response response = await post('your_post_api_url', formData);
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       return null;
//     }
//   }
// }
