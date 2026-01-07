import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/featuer/home/presentation/widget/chalat_image_chalat_item.dart';
import 'package:seave/featuer/home/presentation/widget/fav_icon.dart';

class ChaletItem extends StatelessWidget {
  const ChaletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.oceanBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),
            spreadRadius: 2,
            blurRadius: 25,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: [
              ChalatImageInChalatItem(),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: AppColors.oceanBlue,
                  radius: 20,
                  child: FavIcon(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
