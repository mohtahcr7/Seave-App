import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seave/core/services/get_it_service.dart';
import 'package:seave/featuer/auth/domin/repos/auth_repo.dart';
import 'package:seave/featuer/auth/presentation/cubits/create_user/create_user_cubit.dart';
import 'package:seave/featuer/auth/presentation/widget/register_view_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RegisterViewBlocConsumer(),
      ),
    );
  }
}
