import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'routes/routes.dart';

import 'core/observer/observer.dart';
import '../modules/counter1/cubit/counter1_cubit.dart';
import '../modules/counter2/bloc/counter2_bloc.dart';
import '../modules/counter3/bloc/counter3_bloc.dart';
import '../modules/weather/bloc/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        // : await getTemporaryDirectory(),
        : await getApplicationDocumentsDirectory(),
  );

  if (kDebugMode) {
    Bloc.observer = GlobalObserver();
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => Counter1Cubit(),
    // )
    // return BlocProvider(
    //   create: (context) => Counter2Bloc(),
    // )

    return MultiBlocProvider(
      providers: [
        BlocProvider<Counter1Cubit>(
          create: (context) => Counter1Cubit(),
        ),
        BlocProvider<Counter2Bloc>(
          create: (context) => Counter2Bloc(),
        ),
        BlocProvider<Counter3Bloc>(
          create: (context) => Counter3Bloc(),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );

    // return MaterialApp(
    //   initialRoute: '/',
    //   routes: appRoutes,
    // );
  }
}
