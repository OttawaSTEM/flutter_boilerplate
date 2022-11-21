import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/routes.dart';

import 'core/observer/observer.dart';
import '../modules/counter1/cubit/counter1_cubit.dart';
import '../modules/counter2/bloc/counter2_bloc.dart';

void main() {
  if (kDebugMode) Bloc.observer = GlobalObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Counter1Cubit>(
          create: (context) => Counter1Cubit(),
        ),
        BlocProvider<Counter2Bloc>(
          create: (context) => Counter2Bloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
