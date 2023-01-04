import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';
import 'package:equatable/equatable.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final AuthRepository authRepository;
  SignBloc({required this.authRepository}) : super(SignState.init()) {
    on<SignInUsernameChanged>(onSignInUsernameChanged);
    on<SignInPasswordChanged>(onSignInPasswordChanged);
  }

  Future<void> onSignInUsernameChanged(SignInUsernameChanged event,emit) async {
    emit(state.copyWith(process: SignProcess.loading));

    final result = await authRepository.updateUser(User(id: -1, name: event.username));

    result.fold(
            (fail) => emit(state.copyWith(process: SignProcess.error)),
            (success) => emit(state.copyWith(process: SignProcess.loaded))
    );
  }

  Future<void> onSignInPasswordChanged(SignInPasswordChanged event,emit) async {

  }
}
