import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter30_event.dart';
part 'counter30_state.dart';

class Counter30Bloc extends HydratedBloc<Counter30Event, Counter30State> {
  Counter30Bloc() : super(const Counter30Initial()) {
    on<Counter30IncrementEvent>(_increment);
    on<Counter30DecrementEvent>(_decrement);
  }

  // Future<void> _increment(event, emit) async {
  void _increment(event, emit) {
    emit(Counter30State(
      counter3Value: state.counter3Value + 1,
      counter3Incremented: true,
    ));
  }

  void _decrement(event, emit) {
    emit(Counter30State(
      counter3Value: state.counter3Value - 1,
      counter3Incremented: false,
    ));
  }

  @override
  Counter30State? fromJson(Map<String, dynamic> json) {
    return Counter30State.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(Counter30State state) {
    return state.toMap();
  }
}
