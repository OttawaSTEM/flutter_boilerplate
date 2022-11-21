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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());

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
        BlocProvider<Counter3Bloc>(
          create: (context) => Counter3Bloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
