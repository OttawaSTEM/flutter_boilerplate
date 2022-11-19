part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// waiting to see if the user is authenticated or not on app start.
// if the authentication state was uninitialized, the user might be seeing a splash screen.
class AuthUninitialized extends AuthState {}

class AuthInitial extends AuthState {}

// if the authentication state was authenticated, the user might see a home screen.
class AuthAuthenticated extends AuthState {}

// if the authentication state was unauthenticated, the user might see a login form.
class AuthUnauthenticated extends AuthState {}

class AuthUnknown extends AuthState {}

// waiting to persist/delete a token
// if the authentication state was loading, the user might be seeing a progress indicator.
class AuthLoading extends AuthState {}