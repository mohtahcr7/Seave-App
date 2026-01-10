import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/location_and_icon.dart';

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
        LocationAndIcon(fontSize: 14.sp),
      ],
    );
  }
}
