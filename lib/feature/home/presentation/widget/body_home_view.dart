import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/feature/home/presentation/widget/chalet_grid_view.dart';
import 'package:seave/feature/home/presentation/widget/home_app_bar.dart';
import 'package:seave/feature/home/presentation/widget/see_more_row.dart';
import 'package:seave/feature/home/presentation/widget/village_list_view.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HomeAppBar(),
              Column(
                children: [
                  const SeeMoreRow(title: 'اشهر القري'),
                  SizedBox(height: 140.h, child: const VillageListView()),
                  const SizedBox(height: 25),
                  const SeeMoreRow(title: 'اقترحات من اجلك'),
                ],
              ),
            ],
          ),
        ),

        const ChaletGridView(),
      ],
    );
  }
}




//  Column(
//                   mainAxisAlignment: .center,
//                   children: [
                    // Text(
                    //   'مرحبا',
                    //   style: TextStyles.medium14.copyWith(
                    //     fontFamily: 'Tajawal',
                    //     color: AppColors.lightGrey,
                    //   ),
                    // ),
//                     Text(
//                       'مرحبا',
//                       style: TextStyles.medium14.copyWith(
//                         fontFamily: 'Tajawal',
//                         color: AppColors.lightGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 10),
//                 CircleAvatar(
//                   backgroundColor: AppColors.background,
//                   child: Icon(
//                     Icons.person_3_outlined,
//                     color: AppColors.goldenSun,
//                   ),
//                 ),
            