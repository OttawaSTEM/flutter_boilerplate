import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter1_cubit.dart';

class Counter1Page extends StatefulWidget {
  const Counter1Page({super.key, required this.title});

  final String title;

  @override
  State<Counter1Page> createState() => _Counter1PageState();
}

class _Counter1PageState extends State<Counter1Page> {
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
            BlocConsumer<Counter1Cubit, Counter1State>(
              listener: (context, state) {
                if (state.incremented) {
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
                  state.counterValue.toString(),
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
                    BlocProvider.of<Counter1Cubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<Counter1Cubit>(context).increment();
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
