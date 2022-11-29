import 'package:bloc/bloc.dart';

part 'counter10_state.dart';

class Counter10Cubit extends Cubit<Counter10State> {
  Counter10Cubit() : super(Counter10State(counterValue: 0, incremented: false));

  void increment() => emit(
      Counter10State(counterValue: state.counterValue + 1, incremented: true));

  void decrement() => emit(
      Counter10State(counterValue: state.counterValue - 1, incremented: false));
}
