import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter2_event.dart';
part 'counter2_state.dart';

class Counter2Bloc extends Bloc<Counter2Event, Counter2State> {
  Counter2Bloc() : super(Counter2Initial()) {
    on<Counter2Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
