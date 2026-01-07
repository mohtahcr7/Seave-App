import 'package:flutter/material.dart';
import 'package:seave/featuer/home/presentation/widget/chalet_item.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [SizedBox(height: 20), ChaletItem()]),
    );
  }
}
