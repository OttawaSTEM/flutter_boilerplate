import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../cubit/weather_cubit.dart';
import '../../counter/cubit/counter_cubit.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.title});

  final String title;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
            BlocConsumer<CounterCubit, CounterState>(
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
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            // BlocConsumer<WeatherCubit, WeatherState>(
            //   listener: (context, state) {
            //     if (state.incremented) {
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: const Text('Incremented'),
            //         duration: const Duration(seconds: 1),
            //         action: SnackBarAction(
            //           label: 'ACTION',
            //           onPressed: () {},
            //         ),
            //       ));
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: const Text('Dencremented'),
            //         duration: const Duration(seconds: 1),
            //         action: SnackBarAction(
            //           label: 'ACTION',
            //           onPressed: () {},
            //         ),
            //       ));
            //     }
            //   },
            //   builder: (context, state) {
            //     return Text(
            //       state.counterValue.toString(),
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
            // const SizedBox(
            //   height: 24,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         BlocProvider.of<WeatherCubit>(context).decrement();
            //       },
            //       child: const Icon(Icons.remove),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         BlocProvider.of<WeatherCubit>(context).increment();
            //       },
            //       child: const Icon(Icons.add),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
