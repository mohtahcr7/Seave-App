import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/feature/auth/presentation/views/register_view.dart';

class CreateAccRow extends StatelessWidget {
  const CreateAccRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterView.routeName);
          },
          child: Text(
            'انشاء حساب',
            style: TextStyles.medium18.copyWith(color: AppColors.primary),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'ليس لديك حساب؟',
          style: TextStyles.regular16.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
