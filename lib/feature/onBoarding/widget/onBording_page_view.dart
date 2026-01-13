import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/feature/onBoarding/widget/on_bording_item.dart';
import 'package:seave/gen/assets.gen.dart';

class OnbordingPageView extends StatelessWidget {
  const OnbordingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnbordingItem(
          skipBottomIsVisiable: true,
          backgroundImage: const $AssetsImageGen().oB1Image.path,

          title: const Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('مرحبًا بك في', style: TextStyles.bold24),
              // Text(
              //   'Seave',
              //   style: TextStyle(
              //     fontSize: 24,
              //     color: Colors.deepOrange,
              //     fontWeight: FontWeight.w800,
              //   ),
              // ),
              SizedBox(width: 5),
              Text(
                'Seave',
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          subtitle: 'الإيجار أصبح أسهل من أي وقت، اختار شاليك واحجز بثقة.',
        ),
        OnbordingItem(
          skipBottomIsVisiable: false,
          backgroundImage: const $AssetsImageGen().oB2Image.path,
          title: const Text(
            'راحة البال مع كل حجز',
            style: TextStyle(fontFamily: 'Cairo', fontSize: 22),
          ),
          subtitle: 'حجز آمن، معاملات مضمونة، وتجربة إيجار بلا مفاجآت.',
        ),
      ],
    );
  }
}

//
