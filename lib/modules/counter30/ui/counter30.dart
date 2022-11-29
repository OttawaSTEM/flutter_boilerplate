import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter30_bloc.dart';

class Counter30Page extends StatefulWidget {
  const Counter30Page({super.key, required this.title});

  final String title;

  @override
  State<Counter30Page> createState() => _Counter30PageState();
}

class _Counter30PageState extends State<Counter30Page> {
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
            // BlocBuilder<Counter30Bloc, Counter30State>(
            //   builder: (context, state) {
            //     return Text(
            //       'Counter 2 Vaule: ${state.counter3Value}',
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
            BlocConsumer<Counter30Bloc, Counter30State>(
              listener: (context, state) {
                if (state.counter3Incremented) {
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
                  // state.counter3Value.toString(),
                  'Counter 3 Vaule: ${state.counter3Value}',
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
                    context.read<Counter30Bloc>().add(Counter30DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter30Bloc>().add(Counter30IncrementEvent());
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
