import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitial()) {
//     on<CounterEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CounterBlocs extends Bloc<CounterEvents, CounterStates> {
  CounterBlocs() : super(CounterInitial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterStates(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterStates(counter: state.counter - 1));
    });
  }
}
