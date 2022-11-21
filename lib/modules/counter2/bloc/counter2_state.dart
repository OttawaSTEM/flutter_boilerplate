part of 'counter2_bloc.dart';

class Counter2State extends Equatable {
  final int counter2Value;
  final bool counter2Incremented;

  const Counter2State({
    required this.counter2Value,
    required this.counter2Incremented,
  });

  @override
  List<Object> get props => [counter2Value, counter2Incremented];
}

class Counter2Initial extends Counter2State {
  const Counter2Initial()
      : super(
          counter2Value: 0,
          counter2Incremented: false,
        );
}
