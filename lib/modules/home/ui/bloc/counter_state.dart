part of 'counter_bloc.dart';

// abstract class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// class CounterInitial extends CounterState {}

abstract class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);

  @override
  List<Object> get props => [count];
}

class InitialCounterState extends CounterState {
  const InitialCounterState(int count) : super(count);

  @override
  String toString() => "InitialCounterState with count:${count.toString()}";
}

class UpdatedCounterState extends CounterState {
  const UpdatedCounterState(int count) : super(count);

  @override
  String toString() =>
      "UpdatedCounterState with count:${count.toString()}"; // For testing
}
