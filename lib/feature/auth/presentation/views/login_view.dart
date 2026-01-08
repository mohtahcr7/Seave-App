import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seave/core/services/get_it_service.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/feature/auth/domin/repos/auth_repo.dart';
import 'package:seave/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:seave/feature/auth/presentation/widget/login_view_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: LoginViewBlocConsumer(),
      ),
    );
  }
}
