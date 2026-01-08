import 'package:flutter/material.dart';

class CustomFavIcon extends StatefulWidget {
  const CustomFavIcon({super.key});

  @override
  State<CustomFavIcon> createState() => _CustomFavIconState();
}

class _CustomFavIconState extends State<CustomFavIcon> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLoading = !isLoading;
        });
      },
      icon: isLoading
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border),
    );
  }
}
