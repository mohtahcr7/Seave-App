import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_fav_icon.dart';
import 'package:seave/core/widget/mid_pary_in_card.dart';
import 'package:seave/core/widget/text_and_icon.dart';
import 'package:seave/feature/details/presentation/view/details_view.dart';
import 'package:seave/gen/assets.gen.dart';

class ChaletCard extends StatelessWidget {
  const ChaletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      // 🔥 أهم سطر
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffFCFEFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffE6E9EA),
                  blurRadius: 4, // ⬅ أخف على GPU
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // الصورة
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.hardEdge, // ⬅ مهم للأداء
                      child: Image.asset(
                        const $AssetsImageGen().villagetest.path,
                        fit: BoxFit.cover,
                        cacheWidth: 450, // ⬅ يقلل ضغط GPU
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'بلومار',
                    style: TextStyles.bold14.copyWith(fontFamily: 'Tajawal'),
                  ),
                ),
                const SizedBox(height: 5),
                const MidPartInCard(),
                const SizedBox(height: 15),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextAndIcon(count: '5', text: 'سرير', icon: Icons.bed),
                        TextAndIcon(text: 'الدور الأرضي', icon: Icons.stairs),
                      ],
                    ),
                    Column(
                      children: [
                        TextAndIcon(
                          count: '4',
                          text: 'غرف',
                          icon: Icons.door_back_door_outlined,
                        ),
                        TextAndIcon(
                          count: '2',
                          text: 'حمام',
                          icon: Icons.bathtub,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsView.routeName);
                    },
                    child: Text(
                      'تفاصيل',
                      style: TextStyles.medium16.copyWith(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Positioned(top: 10, right: 10, child: CustomFavIcon()),
        ],
      ),
    );
  }
}
