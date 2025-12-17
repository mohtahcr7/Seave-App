part of 'create_user_cubit.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserLoading extends CreateUserState {}

final class CreateUserSeccess extends CreateUserState {
  final UserEntity userEntity;

  CreateUserSeccess({required this.userEntity});
}

final class CreateUserFailure extends CreateUserState {
  final String errMessage;

  CreateUserFailure({required this.errMessage});
}
