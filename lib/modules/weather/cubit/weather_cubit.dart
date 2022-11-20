import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_state.dart';

// class WeatherCubit extends Cubit<CounterState> {
//   WeatherCubit() : super(CounterInitial(counterValue: 0));

// }

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState(counterValue: 0, incremented: false));

  void increment() => emit(
      WeatherState(counterValue: state.counterValue + 1, incremented: true));

  void decrement() => emit(
      WeatherState(counterValue: state.counterValue - 1, incremented: false));
}
