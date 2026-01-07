import 'package:flutter/material.dart';
import 'package:seave/gen/assets.gen.dart';

class ChalatImageInChalatItem extends StatelessWidget {
  const ChalatImageInChalatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.asset(
        $AssetsImageGen().whatsAppImage20251220At2157111.path,
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
