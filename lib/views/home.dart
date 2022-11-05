import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/data/local/counter.dart';

import '../data/network/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times: ${context.watch<Counter>().count}'),
            const Count(),
            ElevatedButton(
              onPressed: () {
                // HttpService.get();
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Launch screen'),
            ),
            const SizedBox(height: 30),
            SizedBox(
              // width: double.infinity,
              // width: 200,
              // height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // HttpService.get();
                  Navigator.pushNamed(context, '/user');
                },
                child: const Text('User'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            key: const Key('decrement_floatingActionButton'),
            onPressed: () => context.read<Counter>().decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            key: const Key('reset_floatingActionButton'),
            onPressed: () => context.read<Counter>().reset(),
            tooltip: 'Reset',
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            key: const Key('increment_floatingActionButton'),
            onPressed: () => context.read<Counter>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}', key: const Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}
