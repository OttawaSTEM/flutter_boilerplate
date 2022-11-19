part of 'counter_bloc.dart';

// abstract class CounterState extends Equatable {
//   int counter;
//   const CounterStates({required this.counter});
// }
//   @override
//   List<Object> get props => [];
// }

class CounterStates {
  int counter;
  CounterStates({required this.counter});
}

class CounterInitial extends CounterStates {
  CounterInitial() : super(counter: 0);
}
