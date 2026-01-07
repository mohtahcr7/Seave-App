import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/featuer/home/presentation/widget/body_home_view.dart';
import 'package:seave/gen/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sand,

      appBar: AppBar(
        backgroundColor: AppColors.oceanBlue,
        title: Image.asset(
          $AssetsImageGen().seaveLogo.path,
          width: 150,
          color: AppColors.sand,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.sand, size: 30),
        ),
      ),
      body: BodyHomeView(),
    );
  }
}
