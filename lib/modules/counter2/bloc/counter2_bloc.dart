import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter2_event.dart';
part 'counter2_state.dart';

class Counter2Bloc extends Bloc<Counter2Event, Counter2State> {
  Counter2Bloc() : super(const Counter2Initial()) {
    on<Counter2IncrementEvent>(_increment);
    on<Counter2DecrementEvent>(_decrement);
  }

  // Future<void> _increment(event, emit) async {
  void _increment(event, emit) {
    emit(Counter2State(
      counter2Value: state.counter2Value + 1,
      counter2Incremented: true,
    ));
  }

  void _decrement(event, emit) {
    emit(Counter2State(
      counter2Value: state.counter2Value - 1,
      counter2Incremented: false,
    ));
  }
}
