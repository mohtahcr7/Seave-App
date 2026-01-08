import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class MidPartInCard extends StatelessWidget {
  const MidPartInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .end,
      children: [
        Text(
          '500ج/ليله',
          textDirection: TextDirection.rtl,
          style: TextStyles.bold18.copyWith(
            color: AppColors.primary,
            fontFamily: 'Tajawal',
          ),
        ),
        const Spacer(),
        Text(
          'السخنه',
          style: TextStyles.regular12.copyWith(
            color: AppColors.darkGrey,
            fontFamily: 'Tajawal',
          ),
        ),
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
