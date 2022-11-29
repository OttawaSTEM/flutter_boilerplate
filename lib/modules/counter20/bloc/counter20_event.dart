part of 'counter20_bloc.dart';

class Counter20Event extends Equatable {
  const Counter20Event();

  @override
  List<Object> get props => [];
}

class Counter20IncrementEvent extends Counter20Event {}

class Counter20DecrementEvent extends Counter20Event {}
