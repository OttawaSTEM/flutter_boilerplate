part of 'counter30_bloc.dart';

class Counter30State extends Equatable {
  final int counter3Value;
  final bool counter3Incremented;

  const Counter30State({
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

  factory Counter30State.fromMap(Map<String, dynamic> map) {
    return Counter30State(
      counter3Value: map['counter3Value'] as int,
      counter3Incremented: map['counter3Incremented'] as bool,
    );
  }
}

class Counter30Initial extends Counter30State {
  const Counter30Initial()
      : super(
          counter3Value: 0,
          counter3Incremented: false,
        );
}
