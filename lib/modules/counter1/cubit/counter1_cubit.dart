import 'package:bloc/bloc.dart';

part 'counter1_state.dart';

class Counter1Cubit extends Cubit<Counter1State> {
  Counter1Cubit() : super(Counter1State(counterValue: 0, incremented: false));

  void increment() => emit(
      Counter1State(counterValue: state.counterValue + 1, incremented: true));

  void decrement() => emit(
      Counter1State(counterValue: state.counterValue - 1, incremented: false));
}
