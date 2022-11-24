part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}
// class WeatherState extends Equatable {
//   const WeatherState();

//   @override
//   List<Object> get props => [];
// }

class WeatherIsNotLoaded extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final dynamic weatherData;
  const WeatherIsLoaded(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}

// class WeatherIsLoaded extends WeatherState {
//   final WeatherModel weatherModel;

//   const WeatherIsLoaded(this.weatherModel);

//   @override
//   List<Object> get props => [weatherModel];
// }
