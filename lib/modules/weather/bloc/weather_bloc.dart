import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather_model.dart';
import '../repository/weather_repository.dart';

// import '../../../data/network/api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // WeatherRepository weatherRepository;
  // WeatherBloc() : super(WeatherIsNotSearched());

  WeatherBloc(WeatherRepository weatherRepository)
      : super(WeatherIsNotSearched()) {
    on<GetWeatherDataEvent>(_getWeatherData);
  }

  Future<WeatherModel> _getWeatherData(event, emit) async {
    // WeatherModel weatherModel =
    //     await WeatherRepository().getWeatherData(event.cityName);

    // '{"main":{"temp":271.64,"feels_like":269.61,"temp_min":271.06,"temp_max":272.31,"pressure":1022,"humidity":86};
    // dynamic weatherModel =
    //     await WeatherRepository().getWeatherData(event.cityName);

    // WeatherModel weatherModel = await Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () => const WeatherModel(temprature: 200),
    // );

    final response = await http.Client().get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Ottawa&appid=d885aa1d783fd13a55050afeef620fcb'));
    final responseData = json.decode(response.body);
    final weatherData = responseData["main"];
    return (WeatherModel.fromJson(weatherData));
    // emit(WeatherIsLoaded(WeatherModel.fromJson(weatherData)));
    // } else {
    //   emit(WeatherIsLoading);
    //   throw Exception();
    //   // return parsedJson(result.body);

    //   // emit(WeatherI÷sLoaded(weatherModel));
    // }
  }
}

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   WeatherBloc() : super(WeatherInitial()) {
//     on<GetWeatherData>(_getWeatherData);
//   }

//   final url =
//       'http://api.openweathermap.org/data/2.5/weather?q=ottawa&appid=d885aa1d783fd13a55050afeef620fcb';

//   Future _getWeatherData(event, emit) async {
//     final data = await HttpService().get(url);
//     emit(WeatherLoaded(data.main.temp));
//   }
// }
