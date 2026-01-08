import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seave/core/widget/app_feedback.dart';
import 'package:seave/feature/auth/presentation/cubits/create_user/create_user_cubit.dart';
import 'package:seave/feature/auth/presentation/widget/body_register_view.dart';

class RegisterViewBlocConsumer extends StatefulWidget {
  const RegisterViewBlocConsumer({super.key});

  @override
  State<RegisterViewBlocConsumer> createState() =>
      _RegisterViewBlocConsumerState();
}

class _RegisterViewBlocConsumerState extends State<RegisterViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSeccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppFeedback.success('تم انشاء الحساب بنجاح', context: context);
            Navigator.pop(context);
          });
        }
        if (state is CreateUserFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppFeedback.error(state.errMessage, context: context);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is CreateUserLoading ? true : false,
          child: const BodyRegisterView(),
        );
      },
    );
  }
}
