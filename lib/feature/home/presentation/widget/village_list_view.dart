import 'package:flutter/material.dart';
import 'package:seave/feature/home/presentation/widget/village_card.dart';

class VillageListView extends StatelessWidget {
  const VillageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: .horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const VillageCard();
      },
    );
  }
}
