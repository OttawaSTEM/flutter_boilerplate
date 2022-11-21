part of 'counter3_bloc.dart';

class Counter3Event extends Equatable {
  const Counter3Event();

  @override
  List<Object> get props => [];
}

class Counter3IncrementEvent extends Counter3Event {}

class Counter3DecrementEvent extends Counter3Event {}
