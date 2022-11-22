import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    // on<GetWeatherData>(_getWeatherData);
  }

  // Future<void> _getWeatherData(event, emit) async {
  //   emit(WeatherState(
  //     counter2Value: state.counter2Value + 1,
  //     counter2Incremented: true,
  //   ));
  // }
}
