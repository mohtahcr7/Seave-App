import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/feature/chalet_details/presentation/widget/body_details_view.dart';

class ChaletDetailsView extends StatelessWidget {
  const ChaletDetailsView({super.key});
  static const String routeName = 'details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ChaletBodyDetailsView(),
    );
  }
}
