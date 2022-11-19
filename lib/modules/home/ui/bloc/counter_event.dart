part of 'counter_bloc.dart';

abstract class CounterEvents extends Equatable {
  const CounterEvents();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterEvents {}

class DecrementCounterEvent extends CounterEvents {}
