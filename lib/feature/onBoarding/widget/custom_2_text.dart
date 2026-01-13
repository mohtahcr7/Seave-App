import 'package:flutter/material.dart';

class Custom2Text extends StatelessWidget {
  const Custom2Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FruitHUB مرحبا بك في',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
              fontSize: 28,
            ),
          ),
          SizedBox(height: 15),
          Text(
            textAlign: TextAlign.center,
            'اكتشف تجربه تسوق فريده مع  استكشف مجموعتنا الواسعه من الفواكه الطازجه الممتازه و احصل علي افضل العروض و الجوده العاليه',
            style: TextStyle(
              // fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
