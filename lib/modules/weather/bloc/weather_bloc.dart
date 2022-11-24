import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

  Future<void> _getWeatherData(event, emit) async {
    // WeatherModel weatherModel =
    //     await WeatherRepository().getWeatherData(event.cityName);

    // '{"main":{"temp":271.64,"feels_like":269.61,"temp_min":271.06,"temp_max":272.31,"pressure":1022,"humidity":86};
    // dynamic weatherModel =
    //     await WeatherRepository().getWeatherData(event.cityName);

    // print(weatherModel);
    WeatherModel weatherModel = await Future.delayed(
      const Duration(milliseconds: 300),
      () => WeatherModel(temprature: 200),
    );

    emit(WeatherIsLoaded(weatherModel));
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
