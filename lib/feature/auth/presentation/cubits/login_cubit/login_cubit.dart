import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:seave/core/errors/feilures.dart';
import 'package:seave/feature/auth/domin/entity/user_entity.dart';
import 'package:seave/feature/auth/domin/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginwithEmailAndPass({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoading());
    Either<Failures, UserEntity> result = await authRepo.loginWithEmailAndPass(
      email: email,
      pass: pass,
    );

    result.fold(
      (error) => emit(LoginFailure(errMessage: error.errMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }

  Future<void> loginWithGoogle() async {
    Either<Failures, UserEntity> result = await authRepo.loginWithGoogle();
    emit(LoginLoading());
    result.fold(
      (error) => emit(LoginFailure(errMessage: error.errMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }

  Future<void> loginWithFacebook() async {
    Either<Failures, UserEntity> result = await authRepo.loginWithFacebook();
    emit(LoginLoading());
    result.fold(
      (error) => emit(LoginFailure(errMessage: error.errMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }
}
