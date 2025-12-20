import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/core/widget/custom_text_form_field.dart';
import 'package:seave/featuer/auth/presentation/cubits/create_user/create_user_cubit.dart';
import 'package:seave/gen/assets.gen.dart';

class BodyRegisterView extends StatefulWidget {
  const BodyRegisterView({super.key});

  @override
  State<BodyRegisterView> createState() => _BodyRegisterViewState();
}

class _BodyRegisterViewState extends State<BodyRegisterView> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    late String name, email, pass;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.asset($AssetsImageGen().logo.path, width: 250),
              SizedBox(height: 65),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.ivoryWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1a000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text("انشاء حساب", style: TextStyles.bold18),
                      SizedBox(height: 18),
                      CustomTextFormField(
                        hint: 'اسم المستخدم',
                        onSaved: (value) {
                          name = value!;
                        },

                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        hint: 'البريد الالكتروني',
                        onSaved: (value) {
                          email = value!;
                        },

                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        hint: 'كلمة المرور',
                        isObscureText: true,
                        onSaved: (value) {
                          pass = value!;
                        },
                      ),
                      SizedBox(height: 20),

                      CustomBottum(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<CreateUserCubit>().createUser(
                              email: email,
                              name: name,
                              pass: pass,
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        text: 'انشاء حساب',
                      ),
                      SizedBox(height: 20),
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
