import 'package:flutter/material.dart';
import 'package:seave/core/constant/test_images.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_Sliver_app_bar_details_view.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/core/widget/location_and_icon.dart';
import 'package:seave/core/widget/positiv_and_nigative_buttom.dart';
import 'package:seave/feature/chalet_details/presentation/widget/chalet_info_row.dart';
import 'package:seave/feature/chalet_details/presentation/widget/table_calnder.dart';

class ChaletBodyDetailsView extends StatelessWidget {
  ChaletBodyDetailsView({super.key});
  final nightsNotifier = ValueNotifier<int>(0);
  final totalNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    int numberOfNights = 0;
    int totalPrice = 0;

    return CustomScrollView(
      slivers: [
        CustomSliverAppBarDetailsView(testImagesList: chaletImagesTest),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
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

              const ChaletInfoRows(),

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
              BookingCalendar(
                pricePerNight: 800,
                onBookingChanged: (nights, total) {
                  nightsNotifier.value = nights;
                  totalNotifier.value = total;
                },
              ),
              ValueListenableBuilder(
                valueListenable: nightsNotifier,
                builder: (context, nights, _) {
                  return Text('عدد الليالي: $nights');
                },
              ),

              ValueListenableBuilder(
                valueListenable: totalNotifier,
                builder: (context, total, _) {
                  return Text('المجموع: $total جنيه');
                },
              ),

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

List<DateTime> _bookedDays = [
  DateTime(2026, 1, 10),
  DateTime(2026, 1, 11),
  DateTime(2026, 1, 12),
];
