import 'package:bloc_go_router/feature/auth/presentation/auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class KseekGoRouterConfig {

  final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter initialGoRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: routes,
      initialLocation: '/',
      debugLogDiagnostics: true,
      // observers: [KfaAnalyticsService.getAnalyticsObserver],
    );
  }

  List<RouteBase> get routes => [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage()
    ),
  ];

  String? redirectLogic(BuildContext context, GoRouterState goState) {
    // print('goState - - -- - - - - - - ${goState.location}');
    // print('state - - -- - - - - - - ${state.authStatus}');
    //
    // if(goState.extra == 'logOut' || goState.extra == 'signOut'){
    //   return '/auth';
    // }
    //
    // final authStatus = state.authStatus;
    //
    // final logging = goState.location == '/auth';
    //
    // if(authStatus == AuthStatus.unAuth && !logging) {
    //   print('check 됨 - - -- - - - - - - ${state.authStatus}');
    //   return '/auth';
    // }
    //
    // return null;
  }
}