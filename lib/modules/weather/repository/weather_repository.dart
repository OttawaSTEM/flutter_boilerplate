import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather_model.dart';

class WeatherRepository {
  // Future<WeatherModel> getWeatherData(String cityName) async {
  Future<dynamic> getWeatherData(String cityName) async {
    var client = http.Client();
    try {
      final String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=43ea6baaad7663dc17637e22ee6f78f2';
      final response = await client.get(Uri.parse(url));

      final jsonDecodedData = jsonDecode(response.body);
      // return jsonDecodedData;
      return jsonDecodedData['main'];
      // return WeatherModel(temprature: jsonDecodedData['temp']);
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }

  // Future<WeatherModel> getWeatherData(String cityName) async {
  //   var client = http.Client();
  //   try {
  //     final String url =
  //         'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=43ea6baaad7663dc17637e22ee6f78f2';
  //     final response = await client.get(Uri.parse(url));

  //     final jsonDecodedData = jsonDecode(response.body);
  //     // return jsonDecodedData;
  //     print(jsonDecodedData['main']);
  //     return WeatherModel.fromJson(jsonDecodedData['main']);
  //   } finally {
  //     client.close();
  //     print('jsonDecodedData');
  //     throw Exception();
  //   }
  // }

  // WeatherModel parsedJson(final response) {
  //   final jsonDecodedData = jsonDecode(response);

  //   return WeatherModel.fromJson(jsonDecodedData);
  // }
}




// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';

// import '../model/weather_model.dart';

// class WeatherRepository {
//   final logger = Logger();
//   final url =
//       'http://api.openweathermap.org/data/2.5/weather?&appid=d885aa1d783fd13a55050afeef620fcb';
  // 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=d885aa1d783fd13a55050afeef620fcb';

  // final result = await http.Client().get(url      );
  // if (result.statusCode != 200) {
  //   throw Exception();
  // } else {
  //   return parsedJson(result.body);
  // }
  // Future<List<WeatherModel>> getWeatherData() async {
  //   Response response = await http.Client().get(Uri.parse(uri));
  //   if (response.statusCode == 200) {}
  // }

  // Future fetchUsers() async {
  //   var data = [];
  //   String url = apiBaseUrl;
  //   try {
  //     // final response = await http.get(Uri.parse(url));
  //     final response = await http.get(Uri.parse(url));
  //     data = json.decode(response.body);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       logger.e(e.toString());
  //     }
  //   }
  //   return data;
  // }
// }
