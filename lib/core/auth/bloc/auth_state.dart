part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String? token;

  const AuthState({
    this.token,
  });

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial()
      : super(
          token: null,
        );
}

// // waiting to see if the user is authenticated or not on app start.
// // if the authentication state was uninitialized, the user might be seeing a splash screen.
// class AuthUninitialized extends AuthState {}

// // if the authentication state was authenticated, the user might see a home screen.
// class AuthAuthenticated extends AuthState {}

// // if the authentication state was unauthenticated, the user might see a login form.
// class AuthUnauthenticated extends AuthState {}

// class AuthUnknown extends AuthState {}

// // waiting to persist/delete a token
// // if the authentication state was loading, the user might be seeing a progress indicator.
// class AuthLoading extends AuthState {}
