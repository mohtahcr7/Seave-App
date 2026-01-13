import 'package:flutter/material.dart';

class SkipBottum extends StatelessWidget {
  final VoidCallback? onPressed;

  const SkipBottum({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 60,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'تخط',
          style: TextStyle(fontFamily: 'Cairo', color: const Color(0xff949D9E)),
        ),
      ),
    );
  }
}
