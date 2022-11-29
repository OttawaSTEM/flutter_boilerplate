import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter0_model.dart';

class Counter0Page extends StatefulWidget {
  const Counter0Page({super.key, required this.title});

  final String title;

  @override
  State<Counter0Page> createState() => _Counter0PageState();
}

class _Counter0PageState extends State<Counter0Page> {
  // final _counterModel = Counter0Model();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter0Model>(
      create: (_) => Counter0Model(),
      child: Consumer<Counter0Model>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => model.counter--,
                      child: const Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () => model.counter = 0,
                      child: const Icon(Icons.refresh),
                    ),
                    ElevatedButton(
                      onPressed: () => model.counter++,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
