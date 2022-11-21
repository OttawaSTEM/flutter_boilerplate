import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/routes.dart';

import '../modules/counter1/cubit/counter1_cubit.dart';
import '../modules/counter2/cubit/counter2_cubit.dart';
import '../modules/counter2/cubit/counter2_observer.dart';
// import '../modules/weather/cubit/weather_cubit.dart';

// void main() => runApp(const App());
void main() {
  Bloc.observer = Counter2Observer();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   initialRoute: '/',
    //   // initialRoute: '/login',
    //   routes: appRoutes,
    // );

    return BlocProvider(
      // create: (context) => Counter1Cubit(),
      create: (context) => Counter2Cubit(),
      // create: (context) => WeatherCubit(),
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
