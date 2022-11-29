part of 'counter30_bloc.dart';

class Counter30Event extends Equatable {
  const Counter30Event();

  @override
  List<Object> get props => [];
}

class Counter30IncrementEvent extends Counter30Event {}

class Counter30DecrementEvent extends Counter30Event {}
