import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/gen/assets.gen.dart';

class VillageCard extends StatelessWidget {
  const VillageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 168 / 110,
      child: Container(
        margin: const EdgeInsets.only(right: 8),

        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(const $AssetsImageGen().villagetest2.path),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(
              'بلومار ',
              style: TextStyles.bold18.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              '+200 خيار',
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
