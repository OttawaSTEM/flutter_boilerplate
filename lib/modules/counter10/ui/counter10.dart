import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter10_cubit.dart';

class Counter10Page extends StatefulWidget {
  const Counter10Page({super.key, required this.title});

  final String title;

  @override
  State<Counter10Page> createState() => _Counter10PageState();
}

class _Counter10PageState extends State<Counter10Page> {
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
            BlocConsumer<Counter10Cubit, Counter10State>(
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
                    BlocProvider.of<Counter10Cubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<Counter10Cubit>(context).increment();
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
