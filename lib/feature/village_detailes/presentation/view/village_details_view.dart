import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/feature/village_detailes/presentation/widget/body_village_details_view.dart';

class VillageDetailsView extends StatelessWidget {
  const VillageDetailsView({super.key});
  static const String routeName = 'villagedetailsview';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: BodyVillageDetailsView(),
    );
  }
}
