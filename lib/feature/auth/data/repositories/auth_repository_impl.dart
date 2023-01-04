import 'package:bloc_go_router/core/error/failure.dart';
import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';

import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRepositoryImpl() {
    userObserve = BehaviorSubject.seeded(User.empty());
  }

  late final BehaviorSubject<User> userObserve;

  @override
  Stream<User> get getUser => userObserve.stream;
  Sink<User> get _setUser => userObserve.sink;

  @override
  Future<Either<Failure, String>> updateUser(User user) async {
    try{
      _setUser.add(user);

      return const Right('Update user success');
    }catch(e){
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    return const Right('token');
  }


  @override
  Future<Either<Failure, String>> setToken(String token) async {
    return const Right('success');
  }

  @override
  Future<Either<Failure, String>> deleteToken() async {
    return const Right('success');
  }
}