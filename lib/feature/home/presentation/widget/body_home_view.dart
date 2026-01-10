import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/feature/home/presentation/widget/chalet_grid_view.dart';
import 'package:seave/feature/home/presentation/widget/home_app_bar.dart';
import 'package:seave/feature/home/presentation/widget/see_more_row.dart';
import 'package:seave/feature/home/presentation/widget/village_list_view.dart';
import 'package:seave/feature/village_list/presentation/views/village_list_screen.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HomeAppBar()),

        SliverToBoxAdapter(
          child: SeeMoreRow(
            title: 'اشهر القري',
            onPressed: () {
              Navigator.pushNamed(context, VillageListScreen.routeName);
            },
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: 120.h, child: const VillageListView()),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: SeeMoreRow(title: 'اقترحات من اجلك'),
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
            