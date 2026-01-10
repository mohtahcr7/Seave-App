import 'package:flutter/material.dart';
import 'package:seave/core/widget/chalet_card.dart';

class ChaletGridView extends StatelessWidget {
  const ChaletGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: true,
          (context, index) => const RepaintBoundary(child: ChaletCard()),
          childCount: 10,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.5,
        ),
      ),
    );
  }
}
