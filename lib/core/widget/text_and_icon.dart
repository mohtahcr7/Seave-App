import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    super.key,
    required this.text,
    required this.icon,
    this.count = '',
    this.fontSize = 12,
  });
  final String text;
  final String count;
  final IconData icon;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$count $text',
          style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            fontFamily: 'Tajawal',
          ),
          textDirection: .rtl,
        ),
        const SizedBox(width: 5),
        Icon(icon, size: fontSize, color: AppColors.primary),
      ],
    );
  }
}
