import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seave/core/widget/text_and_icon.dart';

class VillageInfoRow extends StatelessWidget {
  const VillageInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextAndIcon(
              text: 'ماركت',
              icon: FontAwesomeIcons.shop,
              count: '2',
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'كافيه',
              icon: FontAwesomeIcons.mugHot,
              count: '2',
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'حمام سباحه',
              icon: FontAwesomeIcons.waterLadder,
              fontSize: 16,
              count: '5',
            ),
          ],
        ),
        SizedBox(height: 9),
        Row(
          mainAxisAlignment: .end,
          children: [
            TextAndIcon(
              text: 'شاطئ رملي',
              icon: FontAwesomeIcons.water,

              fontSize: 16,
            ),
          ],
        ),
      ],
    );
  }
}
