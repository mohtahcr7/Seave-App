import 'package:flutter/material.dart';
import 'package:seave/feature/village_list/presentation/widgets/village_card.dart';

class BodyVillageListView extends StatelessWidget {
  const BodyVillageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (_, index) => const VillageCardInSliverList(),
          ),
        ),
      ],
    );
  }
}
