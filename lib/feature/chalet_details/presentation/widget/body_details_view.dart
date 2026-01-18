import 'package:flutter/material.dart';
import 'package:seave/core/constant/test_images.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_Sliver_app_bar_details_view.dart';
import 'package:seave/core/widget/custom_bottums.dart';
import 'package:seave/core/widget/location_and_icon.dart';
import 'package:seave/feature/chalet_details/presentation/widget/chalet_info_row.dart';
import 'package:seave/feature/chalet_details/presentation/widget/table_calnder.dart';

class ChaletBodyDetailsView extends StatelessWidget {
  ChaletBodyDetailsView({super.key});
  final nightsNotifier = ValueNotifier<int>(0);
  final totalNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // int numberOfNights = 0;
    // int totalPrice = 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomScrollView(
        slivers: [
          CustomSliverAppBarDetailsView(testImagesList: chaletImagesTest),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('قرية بلومار', style: TextStyles.bold18),
                  subtitle: const LocationAndIcon(),
                  trailing: Text(
                    '4000ج/ليله',
                    style: TextStyles.bold16.copyWith(color: AppColors.primary),
                  ),
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

                // const _PriceAndCounters(),
                const SizedBox(height: 20),
                BookingCalendar(
                  pricePerNight: 4000,
                  onBookingChanged: (nights, total) {
                    nightsNotifier.value = nights;
                    totalNotifier.value = total;
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: nightsNotifier,
                  builder: (context, nights, _) {
                    return Text(
                      'عدد الليالي: $nights',
                      style: TextStyles.medium18,
                    );
                  },
                ),

                ValueListenableBuilder(
                  valueListenable: totalNotifier,
                  builder: (context, total, _) {
                    return Text(
                      'المجموع: $total جنيه',
                      style: TextStyles.medium18,
                    );
                  },
                ),

                const SizedBox(height: 20),
                CustomBottum(
                  onPressed: () {
                    // جلب البيانات الحالية من الـ ValueNotifier
                    final nights = nightsNotifier.value;
                    final total = totalNotifier.value;

                    showOrderDialog(context, nights, total);
                  },
                  text: 'ارسال طلب',
                ),

                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showOrderDialog(BuildContext context, int nights, int total) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          title: const Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 60,
                color: AppColors.primary,
              ),
              SizedBox(height: 12),
              Text(
                'تهانينا!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'لقد تم إرسال طلبك لحجز الشاليه بنجاح 🌴',
                  style: TextStyles.medium14,
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('الشاليه:', style: TextStyles.medium16),
                    Text('قرية بلومار', style: TextStyles.medium16),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('عدد الليالي:', style: TextStyles.medium16),
                    Text('$nights', style: TextStyles.medium16),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('المجموع:', style: TextStyles.medium16),
                    Text('$total جنيه', style: TextStyles.medium16),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'سيتم التواصل معك قريباً لتأكيد التفاصيل. استعد لقضاء وقت ممتع!',
                  style: TextStyles.regular14.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'شكراً!',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
