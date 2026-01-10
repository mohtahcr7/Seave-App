import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seave/core/constant/constant.dart';
import 'package:seave/core/errors/custom_exptions.dart';
import 'package:seave/core/errors/feilures.dart';
import 'package:seave/core/services/firebase_auth_service.dart';
import 'package:seave/core/services/firestore_service.dart';
import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/core/utils/backend_endPoint.dart';
import 'package:seave/core/utils/constants.dart';
import 'package:seave/feature/auth/data/user_model.dart';
import 'package:seave/feature/auth/domin/entity/user_entity.dart';
import 'package:seave/feature/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FireStoreService fireStoreService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.fireStoreService,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailandPass({
    required String email,
    required String pass,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPass(
        email: email,
        password: pass,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailures(errMessage: e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithemailandPassword: ${e.toString()}',
      );
      return left(
        ServerFailures(errMessage: 'حدث خطأ غير متوقع أثناء إنشاء الحساب.'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailAndPass({
    required String email,
    required String pass,
  }) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        pass: pass,
      );
      var userEntity = await getUserData(uId: user.uid);
      saveUserData(user: userEntity);
      Prefs.setBool(kUserLoggedIn, true);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailures(errMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.loginWithEmailAndPass: ${e.toString()}');
      return left(
        ServerFailures(errMessage: 'حدث خطأ غير متوقع أثناء تسجيل الدخول.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.loginInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool isExist = await fireStoreService.isUserExist(
        path: BackendEndpoint.isExist,
        doucmentId: user.uid,
      );
      if (isExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailures(errMessage: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.loginWithGoogle: ${e.toString()}');
      return left(
        ServerFailures(errMessage: 'حدث خطأ غير متوقع أثناء تسجيل الدخول.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithFacebook() async {
    try {
      var user = await firebaseAuthService.loginInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailures(errMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.loginWithFacebook: ${e.toString()}');
      return left(
        ServerFailures(errMessage: 'حدث خطأ غير متوقع أثناء تسجيل الدخول.'),
      );
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await fireStoreService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromUserEntity(user).toMap(),
      documnentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await fireStoreService.getData(
      path: BackendEndpoint.getUserData,
      doucmentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    final jsonData = jsonEncode(UserModel.fromUserEntity(user).toMap());
    Prefs.setString(kUserData, jsonData);
  }
}
