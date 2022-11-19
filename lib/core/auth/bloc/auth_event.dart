part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent(Object list);

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  const AppStarted(super.list);

  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final String token;

  const LoggedIn(super.list, this.token);
  // LoggedIn({required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
  // String toString() => 'LoggedIn';
}

class LoggedOut extends AuthEvent {
  const LoggedOut(super.list);

  @override
  String toString() => 'LoggedOut';
}
