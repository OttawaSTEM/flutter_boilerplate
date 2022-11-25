import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(const AuthInitial()) {
    on<UserLoginEvent>(_userAuth);
  }

  Future _userAuth(event, emit) async {
    try {
      dynamic weatherData =
          await _userRepository.getWeatherData(event.cityName);
      emit(AuthState(data: weatherData));
    } catch (e) {
      throw Exception(e);
    }
  }
}
