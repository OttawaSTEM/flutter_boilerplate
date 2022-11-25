import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../routes/routes.dart';

import '../modules/weather/repository/weather_repository.dart';
import '../core/auth/repositories/user_repository.dart';

import '../core/observer/observer.dart';
import '../core/auth/bloc/auth_bloc.dart';
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
