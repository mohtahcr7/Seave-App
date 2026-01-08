import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginBottom extends StatelessWidget {
  const SocialLoginBottom({super.key, required this.image, this.onTap});
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        width: 50,
        // colorFilter: ColorFilter.linearToSrgbGamma(),
      ),
    );
  }
}
