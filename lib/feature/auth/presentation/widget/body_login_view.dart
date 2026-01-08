import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/core/widget/custom_social_bottom.dart';
import 'package:seave/core/widget/custom_text_form_field.dart';
import 'package:seave/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:seave/feature/auth/presentation/widget/create_acc_row.dart';
import 'package:seave/gen/assets.gen.dart';

class BodyLoginView extends StatefulWidget {
  const BodyLoginView({super.key});

  @override
  State<BodyLoginView> createState() => _BodyLoginViewState();
}

class _BodyLoginViewState extends State<BodyLoginView> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    late String email, password;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(const $AssetsImageGen().seaveLogo.path),
              // SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary200,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: AppColors.primary400, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1a000000),
                      offset: Offset(0, 2),
                      blurRadius: 25,
                      spreadRadius: 7,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style: TextStyles.bold18.copyWith(
                          color: AppColors.goldenSun,
                        ),
                      ),
                      const SizedBox(height: 18),
                      CustomTextFormField(
                        hint: 'البريد الالكتروني',
                        onSaved: (value) {
                          email = value!;
                        },
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hint: 'كلمة المرور',
                        isObscureText: true,
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      const SizedBox(height: 20),
                      const CreateAccRow(),
                      const SizedBox(height: 20),
                      CustomBottum(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<LoginCubit>().loginwithEmailAndPass(
                              email: email,
                              pass: password,
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        text: 'تسجيل الدخول',
                      ),
                      const SizedBox(height: 20),
                      CustomSocialBottum(
                        onPressed: () {
                          context.read<LoginCubit>().loginWithGoogle();
                        },
                        text: 'التسجيل باستخدام',
                        iconImage: const $AssetsImageGen().googleIcon.path,
                        backgroundColor: AppColors.primary100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
