import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seave/core/constant/constant.dart';
import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/core/widget/app_feedback.dart';
import 'package:seave/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:seave/feature/auth/presentation/widget/body_login_view.dart';
import 'package:seave/feature/home/presentation/view/home_view.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Prefs.getBool(kUserLoggedIn) == true) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      }
    });

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AppFeedback.success('تم التسجيل بنجاح', context: context);
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }

        if (state is LoginFailure) {
          AppFeedback.error(state.errMessage, context: context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: const BodyLoginView(),
        );
      },
    );
  }
}
