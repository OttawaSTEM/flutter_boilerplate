part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final double temprature;

  const WeatherState({
    required this.temprature,
  });

  @override
  List<Object> get props => [temprature];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial()
      : super(
          temprature: 0,
        );
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
