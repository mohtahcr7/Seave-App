import 'package:flutter/material.dart';
import 'package:seave/core/models/bottom_navigation_bar_model.dart';
import 'package:seave/core/widget/navigation_bar_item.dart';

class CustomNavigatBar extends StatelessWidget {
  const CustomNavigatBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000),
            spreadRadius: 6,
            blurRadius: 35,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomNavigationBarModel.bottomNavigationBarItems
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final item = entry.value;

              return GestureDetector(
                onTap: () => onChanged(index),
                child: NavigatorBarItem(
                  isSelected: currentIndex == index,
                  bottomNavigationBarModel: item,
                ),
              );
            })
            .toList(),
      ),
    );
  }
}
