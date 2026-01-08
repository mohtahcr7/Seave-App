import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    super.key,
    required this.text,
    required this.icon,
    this.count = '',
  });
  final String text;
  final String count;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$count $text',
          style: TextStyles.regular12.copyWith(color: AppColors.darkGrey),
          textDirection: .rtl,
        ),
        const SizedBox(width: 5),
        Icon(icon, size: 14, color: AppColors.primary),
      ],
    );
  }
}
