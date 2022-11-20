// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/modules/counter/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/main.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    // blocTest(description, build: build)
  });
}

  // group('CounterCubit', () {
  //   CounterCubit counterCubit;

  //   setUp(() {
  //     counterCubit = CounterCubit();
  //   });

  //   tearDown(() {
  //     counterCubit.close();
  //   });

  //   test(
  //       'The initial state for the CounterCubit is CounterState(counterValue: 0)',
  //       () {
  //     expect(counterCubit.state,
  //         CounterState(counterValue: 0, incremented: false));
  //   });

  // });
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     CounterCubit counterCubit;
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const App());

//     // Verify that our counter starts at 0.
//     expect(
//         counterCubit.state, CounterState(counterValue: 0, incremented: false));
//   });
// }
