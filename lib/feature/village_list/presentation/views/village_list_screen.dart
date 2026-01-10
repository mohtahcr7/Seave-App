import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/feature/village_list/presentation/widgets/body_village_list_screen.dart';

class VillageListScreen extends StatelessWidget {
  const VillageListScreen({super.key});
  static const String routeName = 'villagelistview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: AppColors.background,
      body: const BodyVillageListView(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text('أشهر القري', style: TextStyle(fontFamily: 'Tajawal')),
        ),
      ),
    );
  }
}
