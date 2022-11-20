import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/routes.dart';

import '../modules/counter/cubit/counter_cubit.dart';

void main() => runApp(const App());

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
      create: (context) => CounterCubit(),
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
