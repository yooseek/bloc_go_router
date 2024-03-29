
import 'package:bloc_go_router/feature/auth/data/auth_data.dart';
import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';

import 'core/config/kseek_go_router_config.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  //core
  serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());


  //dio retrofit

  //remote service(retrofit)

  //data source


  // FCM Service


  //repoimpl
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  //usecases - 생략

  //blocs


  // go_router
  serviceLocator.registerLazySingleton<GoRouter>(() => KseekGoRouterConfig().initialGoRouter());
}
