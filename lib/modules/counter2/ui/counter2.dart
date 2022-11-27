import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter2_bloc.dart';

class Counter2Page extends StatefulWidget {
  const Counter2Page({super.key, required this.title});

  final String title;

  @override
  State<Counter2Page> createState() => _Counter2PageState();
}

class _Counter2PageState extends State<Counter2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // drawer: const NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pushed button:'),
            // BlocBuilder<Counter2Bloc, Counter2State>(
            //   builder: (context, state) {
            //     return Text(
            //       'Counter 2 Vaule: ${state.counter2Value}',
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),

            BlocConsumer<Counter2Bloc, Counter2State>(
              listener: (context, state) {
                if (state.counter2Incremented) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Incremented'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'ACTION',
                      onPressed: () {},
                    ),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Dencremented'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'ACTION',
                      onPressed: () {},
                    ),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  // state.counter2Value.toString(),
                  'Counter 2 Vaule: ${state.counter2Value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter2Bloc>().add(Counter2DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter2Bloc>().add(Counter2IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
