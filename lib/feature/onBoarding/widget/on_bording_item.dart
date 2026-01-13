import 'package:flutter/material.dart';
import 'package:seave/core/constant/constant.dart';
import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/feature/auth/presentation/views/login_view.dart';
import 'package:seave/feature/home/presentation/view/home_view.dart';
import 'package:seave/feature/onBoarding/widget/skip_bottum.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({
    super.key,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.skipBottomIsVisiable,
  });
  final String backgroundImage;
  final String subtitle;
  final Widget title;
  final bool skipBottomIsVisiable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Visibility(
                visible: skipBottomIsVisiable,
                child: SkipBottum(
                  onPressed: () {
                    Prefs.setBool(kIsOnBoardingViewSeen, true);
                    if (kUserLoggedIn == true) {
                      Navigator.pushReplacementNamed(
                        context,
                        HomeView.routeName,
                      );
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 44),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'Cairo', fontSize: 16),
          ),
        ),
      ],
    );
  }
}
