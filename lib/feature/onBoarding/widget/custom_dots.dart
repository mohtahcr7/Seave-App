import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({super.key, required this.currentIndex});
  final dynamic currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 7,
          width: 20,
          decoration: BoxDecoration(
            color: currentIndex == 0 || currentIndex == 1
                ? AppColors.primary
                : AppColors.primary.withAlpha(50),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 7,
          width: 20,
          decoration: BoxDecoration(
            color: currentIndex == 1
                ? AppColors.primary
                : AppColors.primary.withAlpha(50),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
// DotsIndicator(
//       dotsCount: 2,
//       decorator: DotsDecorator(
//         activeColor: AppColors.primary,
//         color: currentIndex == 1
//             ? AppColors.primary
    //         : AppColors.primary.withAlpha(50),
    //   ),
    // );
  