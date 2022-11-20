part of 'weather_cubit.dart';

// abstract class CounterState extends Equatable {
//   int counterValue;
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// class CounterInitial extends CounterState {

//   CounterInitial({required this.counterValue});
// }

class WeatherState {
  int counterValue;
  bool incremented;

  WeatherState({
    required this.counterValue,
    required this.incremented,
  });
}
