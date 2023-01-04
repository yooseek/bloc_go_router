import 'dart:async';

import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState.init()) {
    on<AuthenticationCheckToken>(onAuthenticationCheckToken);
    on<AuthenticationInitializeUser>(onAuthenticationInitializeUser);
    on<AuthenticationUserUpdated>(onAuthenticationUserUpdated);
    on<AuthenticationLogoutRequested>(onAuthenticationLogoutRequested);
  }

  Future<void> onAuthenticationCheckToken(AuthenticationCheckToken event, emit) async {
    emit(state.copyWith(process: AuthProcess.loading));

    final result = await authRepository.getToken();

    result.fold(
            (fail) => emit(state.copyWith(process: AuthProcess.error)),
            (success) {
              /// token이 있는지 확인됨
              emit(state.copyWith(process: AuthProcess.loaded));
              add(AuthenticationInitializeUser());
            }
    );
  }

  Future<void> onAuthenticationInitializeUser(AuthenticationInitializeUser event, emit) async {
    /// token이 있으니 해당 토큰으로 유저 정보 가져와서 확인하기

    await emit.onEach(
      authRepository.getUser,
      onData: (user) {
        if(user is User){
          if(user == User.empty()){
            emit(state.copyWith(user: user,status: AuthStatus.unAuth,process: AuthProcess.loaded));
          }else{
            emit(state.copyWith(user: user,status: AuthStatus.auth,process: AuthProcess.loaded));
          }
        }
      },
      onError: (_, __) {
        debugPrint('getUser 에러 밟생!');
        emit(state.copyWith(process: AuthProcess.error));
      },
    );
  }

  Future<void> onAuthenticationUserUpdated(AuthenticationUserUpdated event, emit) async {
    emit(state.copyWith(process: AuthProcess.loading));

    final result = await authRepository.updateUser(event.user);

    result.fold(
            (fail) => emit(state.copyWith(process: AuthProcess.error)),
            (success) => emit(state.copyWith(process: AuthProcess.loaded))
    );
  }

  Future<void> onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, emit) async {
    emit(state.copyWith(process: AuthProcess.loading));

    final result = await authRepository.deleteToken();

    result.fold(
            (fail) => emit(state.copyWith(process: AuthProcess.error)),
            (success) => emit(state.copyWith(status: AuthStatus.unAuth,process: AuthProcess.loaded))
    );
  }
}
