import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter3_event.dart';
part 'counter3_state.dart';

class Counter3Bloc extends HydratedBloc<Counter3Event, Counter3State> {
  Counter3Bloc() : super(const Counter3Initial()) {
    on<Counter3IncrementEvent>(_increment);
    on<Counter3DecrementEvent>(_decrement);
  }

  // Future<void> _increment(event, emit) async {
  void _increment(event, emit) {
    emit(Counter3State(
      counter3Value: state.counter3Value + 1,
      counter3Incremented: true,
    ));
  }

  void _decrement(event, emit) {
    emit(Counter3State(
      counter3Value: state.counter3Value - 1,
      counter3Incremented: false,
    ));
  }

  @override
  Counter3State? fromJson(Map<String, dynamic> json) {
    return Counter3State.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(Counter3State state) {
    return state.toMap();
  }
}
