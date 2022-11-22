part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class NotSearchingState extends WeatherState {}

class SearchingState extends WeatherState {}

class SearchedWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  SearchedWeatherState(
    this.weatherModel,
  );

  @override
  List<Object> get props => [weatherModel];
}
