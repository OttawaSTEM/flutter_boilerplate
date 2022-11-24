import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    on<GetWeatherDataEvent>(_getWeatherData);
  }

  Future _getWeatherData(event, emit) async {
    try {
      dynamic weatherData =
          await _weatherRepository.getWeatherData(event.cityName);
      emit(WeatherState(data: weatherData));
    } catch (e) {
      throw Exception(e);
    }
  }
}
