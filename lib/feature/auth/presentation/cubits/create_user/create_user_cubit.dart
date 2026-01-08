import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:seave/feature/auth/domin/entity/user_entity.dart';
import 'package:seave/feature/auth/domin/repos/auth_repo.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepo) : super(CreateUserInitial());
  final AuthRepo authRepo;
  Future<void> createUser({
    required String email,
    required String name,
    required String pass,
  }) async {
    emit(CreateUserLoading());
    final result = await authRepo.createUserWithEmailandPass(
      email: email,
      pass: pass,
      name: name,
    );

    result.fold(
      (error) => emit(CreateUserFailure(errMessage: error.errMessage)),
      (success) => emit(CreateUserSeccess(userEntity: success)),
    );
  }
}
