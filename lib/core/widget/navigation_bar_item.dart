import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seave/core/models/bottom_navigation_bar_model.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/widget/active_icon_navigation_bar.dart';

class NavigatorBarItem extends StatelessWidget {
  const NavigatorBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarModel,
  });

  final bool isSelected;
  final BottomNavigationBarModel bottomNavigationBarModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      // مجرد ValueKey ثابت هنا
      child: isSelected
          ? ActiveIconNavigationBar(
              key: const ValueKey('active'),
              image: bottomNavigationBarModel.activeIcon,
              title: bottomNavigationBarModel.title,
            )
          : _InActiveIcon(
              key: const ValueKey('inactive'),
              image: bottomNavigationBarModel.outlineIcon,
            ),
    );
  }
}

class _InActiveIcon extends StatelessWidget {
  const _InActiveIcon({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        image,
        width: 26,
        height: 26,
        colorFilter: const ColorFilter.mode(
          AppColors.goldenSun,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
