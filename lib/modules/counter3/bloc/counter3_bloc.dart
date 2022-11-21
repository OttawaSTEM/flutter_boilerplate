import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter3_event.dart';
part 'counter3_state.dart';

class Counter3Bloc extends Bloc<Counter3Event, Counter3State> {
  Counter3Bloc() : super(const Counter3Initial()) {
    on<Counter3IncrementEvent>(_increment);
    on<Counter3DecrementEvent>(_decrement);
  }

  // Future<void> _increment(event, emit) async {
  void _increment(event, emit) {
    emit(Counter3State(
      counter2Value: state.counter2Value + 1,
      counter2Incremented: true,
    ));
  }

  void _decrement(event, emit) {
    emit(Counter3State(
      counter2Value: state.counter2Value - 1,
      counter2Incremented: false,
    ));
  }
}
