import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter3_bloc.dart';

class Counter3Page extends StatefulWidget {
  const Counter3Page({super.key, required this.title});

  final String title;

  @override
  State<Counter3Page> createState() => _Counter3PageState();
}

class _Counter3PageState extends State<Counter3Page> {
  // final Future _users = HttpService().fetchUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pushed button:'),
            // BlocBuilder<Counter3Bloc, Counter3State>(
            //   builder: (context, state) {
            //     return Text(
            //       'Counter 2 Vaule: ${state.counter3Value}',
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
            BlocConsumer<Counter3Bloc, Counter3State>(
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
                    context.read<Counter3Bloc>().add(Counter3DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter3Bloc>().add(Counter3IncrementEvent());
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
