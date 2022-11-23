import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/network/api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherInitial()) {
    on<GetWeatherDataEvent>(_getWeatherData);
  }

  // _getWeatherData(event, emit) {
  //   emit(WeatherState(
  //     temprature: state.temprature + 1,
  //   ));
  // }

  final url =
      'http://api.openweathermap.org/data/2.5/weather?q=ottawa&appid=d885aa1d783fd13a55050afeef620fcb';

  Future _getWeatherData(event, emit) async {
    final dynamic data = await HttpService().get(
        'https://api.openweathermap.org/data/2.5/weather?q=ottawa&appid=d885aa1d783fd13a55050afeef620fcb/');
    print(data);
    // if (data) {
    //   emit(WeatherState(
    //     temprature: data.main.temp,
    //   ));
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
