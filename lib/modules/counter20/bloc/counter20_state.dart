part of 'counter20_bloc.dart';

class Counter20State extends Equatable {
  final int counter2Value;
  final bool counter2Incremented;

  const Counter20State({
    required this.counter2Value,
    required this.counter2Incremented,
  });

  @override
  List<Object> get props => [counter2Value, counter2Incremented];
}

class Counter20Initial extends Counter20State {
  const Counter20Initial()
      : super(
          counter2Value: 0,
          counter2Incremented: false,
        );
}
