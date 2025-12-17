import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';
import 'package:seave/gen/assets.gen.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset($AssetsImageGen().logo.path),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.ivoryWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1a000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,

          ),
        ],
      ),
    );
  }
}
