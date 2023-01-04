part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthenticationCheckToken extends AuthEvent {}

class AuthenticationInitializeUser extends AuthEvent {}

class AuthenticationUserUpdated extends AuthEvent {
  const AuthenticationUserUpdated(this.user);

  final User user;
}

class AuthenticationLogoutRequested extends AuthEvent {}