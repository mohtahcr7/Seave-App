import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seave/core/utils/app_color.dart';

class CustomSocialBottum extends StatelessWidget {
  const CustomSocialBottum({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primary,
    required this.iconImage,
  });
  final VoidCallback onPressed;
  final String text, iconImage;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 19),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(iconImage, width: 26),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomSocialBottom extends StatelessWidget {
//   const CustomSocialBottom({
//     super.key,
//     this.onPressed,
//     required this.text,
//     required this.iconImage,
//   });
//   final void Function()? onPressed;
//   final String text, iconImage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xffDDDFDF)),
//       ),
//       width: double.infinity,
//       child: TextButton(
//         // style: TextButton.styleFrom(),
//         onPressed: onPressed,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             children: [
//               SvgPicture.asset(iconImage, width: 26),
//               Spacer(),
//               Text(
//                 text,
//                 style: TextStyles.bold16.copyWith(color: Colors.black),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
