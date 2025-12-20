import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/featuer/auth/presentation/views/register_view.dart';

class CreateAccRow extends StatelessWidget {
  const CreateAccRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterView.routeName);
          },
          child: Text(
            'انشاء حساب',
            style: TextStyles.medium18.copyWith(color: AppColors.coral),
          ),
        ),
        Text(
          'ليس لديك حساب؟',
          style: TextStyles.regular16.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
