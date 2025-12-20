import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seave/core/services/get_it_service.dart';
import 'package:seave/featuer/auth/domin/repos/auth_repo.dart';
import 'package:seave/featuer/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:seave/featuer/auth/presentation/widget/login_view_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoginViewBlocConsumer(),
      ),
    );
  }
}
