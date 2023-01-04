part of 'sign_bloc.dart';

abstract class SignEvent extends Equatable {
  const SignEvent();

  @override
  List<Object> get props => [];
}

class SignInUsernameChanged extends SignEvent {
  const SignInUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class SignInPasswordChanged extends SignEvent {
  const SignInPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
