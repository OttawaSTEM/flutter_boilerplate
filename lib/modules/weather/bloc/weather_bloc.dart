import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/network/api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherData>(_getWeatherData);
  }

  final url =
      'http://api.openweathermap.org/data/2.5/weather?q=ottawa&appid=d885aa1d783fd13a55050afeef620fcb';

  Future _getWeatherData(event, emit) async {
    final data = await HttpService().get(url);
    emit(WeatherLoaded(data.main.temp));
  }
}
