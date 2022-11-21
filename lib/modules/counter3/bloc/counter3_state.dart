// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter3_bloc.dart';

class Counter3State extends Equatable {
  final int counter2Value;
  final bool counter2Incremented;

  const Counter3State({
    required this.counter2Value,
    required this.counter2Incremented,
  });

  @override
  List<Object> get props => [counter2Value, counter2Incremented];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter2Value': counter2Value,
      'counter2Incremented': counter2Incremented,
    };
  }

  factory Counter3State.fromMap(Map<String, dynamic> map) {
    return Counter3State(
      counter2Value: map['counter2Value'] as int,
      counter2Incremented: map['counter2Incremented'] as bool,
    );
  }
}

class Counter3Initial extends Counter3State {
  const Counter3Initial()
      : super(
          counter2Value: 0,
          counter2Incremented: false,
        );
}
