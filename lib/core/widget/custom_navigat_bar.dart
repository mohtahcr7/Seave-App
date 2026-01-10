import 'package:flutter/material.dart';
import 'package:seave/core/models/bottom_navigation_bar_model.dart';
import 'package:seave/core/widget/navigation_bar_item.dart';

class CustomNavigatBar extends StatefulWidget {
  const CustomNavigatBar({super.key});

  @override
  State<CustomNavigatBar> createState() => _CustomNavigatBarState();
}

class _CustomNavigatBarState extends State<CustomNavigatBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
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
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: NavigatorBarItem(
                  key: ValueKey('nav_item_$index'),
                  isSelected: selectedIndex == index,
                  bottomNavigationBarModel: item,
                ),
              );
            })
            .toList(),
      ),
    );
  }
}
