import 'package:flutter/material.dart';
import 'package:seave/core/widget/text_and_icon.dart';

class ChaletInfoRows extends StatelessWidget {
  const ChaletInfoRows({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextAndIcon(
              text: 'اول علوي',
              icon: Icons.stairs_outlined,
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'سرير',
              icon: Icons.bed_rounded,
              count: '2',
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'غرفه',
              icon: Icons.door_front_door_outlined,
              count: '1',
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextAndIcon(
              text: 'حمام',
              icon: Icons.bathtub_rounded,
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'المساحه',
              icon: Icons.apartment_outlined,
              count: '160',
              fontSize: 16,
            ),
            TextAndIcon(
              text: 'د لي البحر',
              icon: Icons.swap_calls_rounded,
              count: '5',
              fontSize: 16,
            ),
          ],
        ),
      ],
    );
  }
}
