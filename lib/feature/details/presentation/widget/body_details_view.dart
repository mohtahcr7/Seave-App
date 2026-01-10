import 'package:flutter/material.dart';
import 'package:seave/core/constant/text_images.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_Sliver_app_bar_details_view.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/core/widget/location_and_icon.dart';
import 'package:seave/core/widget/positiv_and_nigative_buttom.dart';
import 'package:seave/core/widget/text_and_icon.dart';

class BodyDetailsView extends StatelessWidget {
  const BodyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBarDetailsView(imagesList: chaletImagesTest),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const Align(
                alignment: Alignment.centerRight,
                child: Text('فندق بلومار', style: TextStyles.bold18),
              ),
              const SizedBox(height: 9),
              const Align(
                alignment: Alignment.centerRight,
                child: LocationAndIcon(),
              ),
              const SizedBox(height: 20),

              const _InfoRows(),

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
              const _PriceAndCounters(),

              const SizedBox(height: 20),
              CustomBottum(onPressed: () {}, text: 'ارسال طلب'),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ],
    );
  }
}

class _InfoRows extends StatelessWidget {
  const _InfoRows();

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

class _PriceAndCounters extends StatelessWidget {
  const _PriceAndCounters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text('السعر', style: TextStyles.bold16),
            const SizedBox(height: 10),
            Text(
              'ليله\\ج800',
              style: TextStyles.bold16.copyWith(color: AppColors.primary),
              textAlign: .left,
            ),
          ],
        ),
        const PostivAndNigativButtom(title: 'عدد الافراد'),
        const PostivAndNigativButtom(title: 'عدد الليالي'),
      ],
    );
  }
}
