part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final dynamic data;

  const WeatherState({
    this.data,
  });

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial()
      : super(
          data: null,
        );
}
