import 'package:flutter/material.dart';
import 'package:seave/feature/onBoarding/widget/body_on_bording.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routName = 'onBording';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyOnBording());
  }
}
