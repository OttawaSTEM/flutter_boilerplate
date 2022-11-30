import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../routes/routes.dart';

import '../modules/weather/repository/weather_repository.dart';

import '../core/observer/observer.dart';
import '../modules/counter10/cubit/counter10_cubit.dart';
import '../modules/counter20/bloc/counter20_bloc.dart';
import '../modules/counter30/bloc/counter30_bloc.dart';
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
    // return MaterialApp(
    //   initialRoute: '/',
    //   routes: appRoutes,
    // );

    // return BlocProvider(
    //   create: (context) => Counter1Cubit(),
    //   child: MaterialApp(
    //     initialRoute: '/',
    //     routes: appRoutes,
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider<Counter10Cubit>(
          create: (context) => Counter10Cubit(),
        ),
        BlocProvider<Counter20Bloc>(
          create: (context) => Counter20Bloc(),
        ),
        BlocProvider<Counter30Bloc>(
          create: (context) => Counter30Bloc(),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(WeatherRepository()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(UserRepository()),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
