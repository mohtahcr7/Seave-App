import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/gen/assets.gen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                // crossAxisAlignment: .center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 40),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      const $AssetsImageGen().notification.path,
                      colorFilter: const ColorFilter.mode(
                        AppColors.lightGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  SvgPicture.asset(
                    const $AssetsImageGen().seaveLogo0.path,
                    width: 140,
                    colorFilter: const ColorFilter.mode(
                      AppColors.background,
                      BlendMode.srcIn,
                    ),
                    fit: .fill,
                  ),

                  Text(
                    ' مرحبا بك في',
                    style: TextStyles.medium14.copyWith(
                      fontFamily: 'Tajawal',
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
