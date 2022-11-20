part of 'counter_cubit.dart';

// abstract class CounterState extends Equatable {
//   int counterValue;
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// class CounterInitial extends CounterState {

//   CounterInitial({required this.counterValue});
// }

class CounterState {
  final int counterValue;

  CounterState({
    required this.counterValue,
  });
}
