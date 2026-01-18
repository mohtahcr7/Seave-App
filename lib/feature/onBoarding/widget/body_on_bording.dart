import 'package:flutter/material.dart';
import 'package:seave/core/constant/constant.dart';
import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/feature/auth/presentation/views/login_view.dart';
import 'package:seave/feature/home/presentation/view/main_layout.dart';
import 'package:seave/feature/onBoarding/widget/custom_dots.dart';
import 'package:seave/feature/onBoarding/widget/onBording_page_view.dart';

class BodyOnBording extends StatefulWidget {
  const BodyOnBording({super.key});

  @override
  State<BodyOnBording> createState() => _BodyOnBordingState();
}

class _BodyOnBordingState extends State<BodyOnBording> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnbordingPageView(pageController: pageController)),
        CustomDots(currentIndex: currentPage),
        const SizedBox(height: 35),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 || currentPage == 0 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomBottum(
              onPressed: () {
                Prefs.setBool(kIsOnBoardingViewSeen, true);
                if (Prefs.getBool(kUserLoggedIn) == true) {
                  Navigator.pushReplacementNamed(context, MainLayout.routeName);
                } else {
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                }
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
