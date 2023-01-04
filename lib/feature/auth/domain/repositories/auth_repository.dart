import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository{
  Stream<User> get getUser;

  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, String>> setToken(String token);
  Future<Either<Failure, String>> deleteToken();

  Future<Either<Failure, String>> updateUser(User user);
}