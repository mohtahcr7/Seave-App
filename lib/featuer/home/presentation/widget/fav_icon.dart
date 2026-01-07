import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
      icon: _isFavorited
          ? Icon(
              Icons.favorite_rounded,
              fontWeight: FontWeight.w800,
              color: Colors.red,
            )
          : Icon(
              Icons.favorite_outline_rounded,
              fontWeight: FontWeight.w800,
              color: AppColors.sand,
            ),
    );
  }
}
