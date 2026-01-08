import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class SeeMoreRow extends StatelessWidget {
  const SeeMoreRow({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'رؤية المزيد',
              style: TextStyles.medium14.copyWith(
                fontFamily: 'Tajawal',
                color: AppColors.primary,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyles.bold16.copyWith(
              fontFamily: 'Tajawal',
              color: AppColors.textBlack,
            ),
          ),
        ],
      ),
    );
  }
}
