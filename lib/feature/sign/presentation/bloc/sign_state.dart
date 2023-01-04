part of 'sign_bloc.dart';

enum SignStatus {
  signIn,
  signUp,
  unKnown,
}

enum SignProcess {
  init,
  loading,
  loaded,
  error,
}

class SignState extends Equatable {
  final SignStatus status;
  final SignProcess process;
  final String name;

  const SignState({
    required this.status,
    required this.process,
    required this.name,
  });

  factory SignState.init(){
    return const SignState(
        status: SignStatus.unKnown, process: SignProcess.init, name: '');
  }

  SignState copyWith({
    SignStatus? status,
    SignProcess? process,
    String? name,
  }) {
    return SignState(
      status: status ?? this.status,
      process: process ?? this.process,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [status, process, name];
}