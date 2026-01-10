import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/widget/custom_navigat_bar.dart';
import 'package:seave/feature/home/presentation/widget/body_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: CustomNavigatBar(),

      body: BodyHomeView(),
    );
  }
}
