import 'package:dartz/dartz.dart';
import 'package:seave/core/errors/feilures.dart';
import 'package:seave/featuer/auth/domin/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailandPass({
    required String email,
    required String pass,
    required String name,
  });
  Future<Either<Failures, UserEntity>> loginWithEmailAndPass({
    required String email,
    required String pass,
  });
  Future<Either<Failures, UserEntity>> loginWithGoogle();
  Future<Either<Failures, UserEntity>> loginWithFacebook();
  Future addUserData({required UserEntity user});
  Future<void> saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
}
