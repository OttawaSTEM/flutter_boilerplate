import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter20_event.dart';
part 'counter20_state.dart';

class Counter20Bloc extends Bloc<Counter20Event, Counter20State> {
  Counter20Bloc() : super(const Counter20Initial()) {
    on<Counter20IncrementEvent>(_increment);
    on<Counter20DecrementEvent>(_decrement);
  }

  // Future<void> _increment(event, emit) async {
  void _increment(event, emit) {
    emit(Counter20State(
      counter2Value: state.counter2Value + 1,
      counter2Incremented: true,
    ));
  }

  void _decrement(event, emit) {
    emit(Counter20State(
      counter2Value: state.counter2Value - 1,
      counter2Incremented: false,
    ));
  }
}
