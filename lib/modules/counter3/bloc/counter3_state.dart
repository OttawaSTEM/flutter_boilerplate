part of 'counter3_bloc.dart';

class Counter3State extends Equatable {
  final int counter3Value;
  final bool counter3Incremented;

  const Counter3State({
    required this.counter3Value,
    required this.counter3Incremented,
  });

  @override
  List<Object> get props => [counter3Value, counter3Incremented];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter3Value': counter3Value,
      'counter3Incremented': counter3Incremented,
    };
  }

  factory Counter3State.fromMap(Map<String, dynamic> map) {
    return Counter3State(
      counter3Value: map['counter3Value'] as int,
      counter3Incremented: map['counter3Incremented'] as bool,
    );
  }
}

class Counter3Initial extends Counter3State {
  const Counter3Initial()
      : super(
          counter3Value: 0,
          counter3Incremented: false,
        );
}
