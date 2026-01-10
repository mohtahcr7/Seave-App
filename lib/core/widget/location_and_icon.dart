import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';

class LocationAndIcon extends StatelessWidget {
  const LocationAndIcon({super.key, this.fontSize = 18});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'السخنه',
          style: TextStyle(
            color: AppColors.darkGrey,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
          ),
        ),
        Icon(
          Icons.location_on_outlined,
          size: fontSize,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
