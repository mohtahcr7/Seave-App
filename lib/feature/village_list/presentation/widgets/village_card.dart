import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/core/utils/app_text_styles.dart';
import 'package:seave/core/widget/custom_fav_icon.dart';
import 'package:seave/core/widget/location_and_icon.dart';
import 'package:seave/feature/village_detailes/presentation/view/village_details_view.dart';
import 'package:seave/gen/assets.gen.dart';

class VillageCardInSliverList extends StatelessWidget {
  const VillageCardInSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      // 🔥 أهم سطر
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: AspectRatio(
          aspectRatio: 353 / 302,
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

                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'بلومار',
                        style: TextStyles.bold14.copyWith(
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: LocationAndIcon(fontSize: 14.sp),
                    ),
                    const SizedBox(height: 15),

                    Text(
                      textDirection: TextDirection.rtl,
                      'قريه معفنه بها 5 حمامات سباحه و علي مساحه 3 فدانقريه معفنه بها 5 حمامات سباحه و علي مساحه 3 فدان',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.regular12.copyWith(
                        color: AppColors.darkGrey,
                      ),
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
                          Navigator.pushNamed(
                            context,
                            VillageDetailsView.routeName,
                          );
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
        ),
      ),
    );
  }
}
