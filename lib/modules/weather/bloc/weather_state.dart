part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsNotLoaded extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherIsLoaded(this.weatherModel);

  // WeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [weatherModel];
}


// class WeatherState extends Equatable {

//   @override
//   List<Object> get props => [];
// }

// class WeatherInitial extends WeatherState {}

// class WeatherLoaded extends WeatherState {
//   final double temprature;

//   WeatherLoaded(this.temprature);

//   @override
//   List<Object> get props => [];
// }

// class NotSearchingState extends WeatherState {}

// class SearchingState extends WeatherState {}

// class SearchedWeatherState extends WeatherState {
//   final WeatherModel weatherModel;

//   SearchedWeatherState(
//     this.weatherModel,
//   );

//   @override
//   List<Object> get props => [weatherModel];
// }
