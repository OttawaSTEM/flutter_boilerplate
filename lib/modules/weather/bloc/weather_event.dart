part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherDataEvent extends WeatherEvent {}

// class GetWeatherData extends WeatherEvent {
//   @override
//   List<Object> get props => [];
// }



// class GetWeatherData extends WeatherEvent {
//   final String cityName;

//   const GetWeatherData({required this.cityName});

//   @override
//   List<Object> get props => [cityName];
// }

// class ResetWeatherData extends WeatherEvent {}
