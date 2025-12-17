import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class CustomSocialBottom extends StatelessWidget {
  const CustomSocialBottom({
    super.key,
    this.onPressed,
    required this.text,
    required this.iconImage,
  });
  final void Function()? onPressed;
  final String text, iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffDDDFDF)),
      ),
      width: double.infinity,
      child: TextButton(
        // style: TextButton.styleFrom(),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset(iconImage, width: 26),
              Spacer(),
              Text(
                text,
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
