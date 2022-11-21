part of 'counter2_bloc.dart';

abstract class Counter2State extends Equatable {
  final int counterValue;
  final bool incremented;
  const Counter2State({
    required this.counterValue,
    required this.incremented,
  });

  @override
  List<Object> get props => [];
}

class Counter2Initial extends Counter2State {
  const Counter2Initial()
      : super(
          counterValue: 0,
          incremented: false,
        );
}
