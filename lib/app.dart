import 'package:bloc_go_router/feature/auth/presentation/auth_presentation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository: serviceLocator())..add(AuthenticationCheckToken())),
        // BlocProvider<UserBloc>(create: (context) => serviceLocator()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(430, 932));

    return MaterialApp.router(
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous.status != current.status || previous.process != current.process,
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.auth:
                /// routerConfig 선언보다 먼저 GoRouter 를 사용하기 때문에
                /// 여기서만 GoRouter 를 직접 먼저 호출함
                serviceLocator<GoRouter>().goNamed('home');
                break;
              case AuthStatus.unAuth:
                serviceLocator<GoRouter>().goNamed('sign');
                break;
              case AuthStatus.unKnown:
                break;
            }
            switch (state.process) {
              case AuthProcess.loading:
                break;
              case AuthProcess.loaded:
                break;
              case AuthProcess.error:
                break;
              case AuthProcess.init:
                break;
            }
          },
          child: child,
        );
      },
      theme: ThemeData(useMaterial3: true),
      routerConfig: serviceLocator<GoRouter>(),
    );
  }
}
