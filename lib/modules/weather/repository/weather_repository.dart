import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather_model.dart';

class WeatherRepository {
  Future<dynamic> getWeatherData(String cityName) async {
    var client = http.Client();
    try {
      final String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=43ea6baaad7663dc17637e22ee6f78f2';
      final response = await client.get(Uri.parse(url));

      final jsonDecodedData = jsonDecode(response.body);
      // return jsonDecodedData;
      // print(jsonDecodedData['main']);
      return jsonDecodedData['main'];
      // return WeatherModel(temprature: jsonDecodedData['main']['temp']);
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }
}

// class WeatherRepository {
//   // Future<dynamic> getWeatherData(String cityName) async {
//   Future<WeatherModel> getWeatherData(String cityName) async {
//     var client = http.Client();
//     try {
//       final String url =
//           'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=43ea6baaad7663dc17637e22ee6f78f2';
//       final response = await client.get(Uri.parse(url));

//       final jsonDecodedData = jsonDecode(response.body);
//       // return jsonDecodedData;
//       // return jsonDecodedData['main'];
//       // print(jsonDecodedData['main']);
//       return WeatherModel(temprature: jsonDecodedData['main']['temp']);
//     } catch (e) {
//       throw Exception(e);
//     } finally {
//       client.close();
//     }
//   }
// }
