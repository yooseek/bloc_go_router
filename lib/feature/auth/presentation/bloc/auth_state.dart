part of 'auth_bloc.dart';

enum AuthStatus {
  unKnown,
  auth,
  unAuth,
}

enum AuthProcess {
  init,
  loading,
  loaded,
  error,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthProcess process;
  final User user;

  const AuthState({
    required this.status,
    required this.process,
    required this.user,
  });

  factory AuthState.init(){
    return AuthState(status: AuthStatus.unKnown, process: AuthProcess.init, user: User.empty());
  }

  AuthState copyWith({
    AuthStatus? status,
    AuthProcess? process,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      process: process ?? this.process,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, process, user];
}