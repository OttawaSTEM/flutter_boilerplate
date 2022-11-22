import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../model/weather_model.dart';

class WeatherRepository {
  final logger = Logger();
  final url =
      'http://api.openweathermap.org/data/2.5/weather?&appid=d885aa1d783fd13a55050afeef620fcb';
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
}
