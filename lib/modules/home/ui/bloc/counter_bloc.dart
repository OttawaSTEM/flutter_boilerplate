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

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count;

  CounterBloc({this.count = 0}) : super(InitialCounterState(count));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterEvent) {
      this.count = this.count + 1;
      yield UpdatedCounterState(this.count);
    } else if (event is DecrementCounterEvent) {
      this.count = this.count - 1;
      yield UpdatedCounterState(this.count);
    } else {
      throw UnknownEventException();
    }
  }
}

class UnknownEventException extends Equatable implements Exception {
  const UnknownEventException();
  @override
  List<Object> get props => [];
}
