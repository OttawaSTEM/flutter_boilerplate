import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter20_bloc.dart';

class Counter20Page extends StatefulWidget {
  const Counter20Page({super.key, required this.title});

  final String title;

  @override
  State<Counter20Page> createState() => _Counter20PageState();
}

class _Counter20PageState extends State<Counter20Page> {
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
            // BlocBuilder<Counter20Bloc, Counter20State>(
            //   builder: (context, state) {
            //     return Text(
            //       'Counter 2 Vaule: ${state.counter2Value}',
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),

            BlocConsumer<Counter20Bloc, Counter20State>(
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
                    context.read<Counter20Bloc>().add(Counter20DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter20Bloc>().add(Counter20IncrementEvent());
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
