import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class GlobalObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
      print(change.currentState.counterValue);
      print(change.nextState.counterValue);
    }
  }
}
