part of 'counter2_bloc.dart';

class Counter2Event extends Equatable {
  const Counter2Event();

  @override
  List<Object> get props => [];
}

class Counter2IncrementEvent extends Counter2Event {}

class Counter2DecrementEvent extends Counter2Event {}
