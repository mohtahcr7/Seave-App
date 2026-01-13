import 'package:flutter/material.dart';
import 'package:seave/core/constant/test_images.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_Sliver_app_bar_details_view.dart';
import 'package:seave/core/widget/location_and_icon.dart';
import 'package:seave/feature/village_detailes/presentation/widget/village_info_row.dart';

class BodyVillageDetailsView extends StatelessWidget {
  const BodyVillageDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBarDetailsView(testImagesList: villageImagesTest),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('قرية بلومار', style: TextStyles.bold18),
              ),
              const SizedBox(height: 9),
              const Align(
                alignment: Alignment.centerRight,
                child: LocationAndIcon(),
              ),
              const SizedBox(height: 20),
              const VillageInfoRow(),
              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerRight,
                child: Text('الوصف', style: TextStyles.bold16),
              ),
              const SizedBox(height: 8),
              const Text(
                'استمتع بتجربة إقامة راقية تجمع بين الراحة والهدوء، مع غرف مصممة بعناية، إطلالات مميزة، وخدمات فندقية متكاملة تضمن لك إقامة مريحة وتجربة لا تُنسى.',
                textAlign: TextAlign.right,
                style: TextStyles.regular14,
              ),

              const SizedBox(height: 20),
            ]),
          ),
        ),
      ],
    );
  }
}
