import 'package:flutter/material.dart';
import 'package:seave/core/widget/custom_navigat_bar.dart';
import 'package:seave/feature/explor/presentation/view/explor_view.dart';
import 'package:seave/feature/fav/presentation/view/favorit_view.dart';
import 'package:seave/feature/home/presentation/view/home_view.dart';
import 'package:seave/feature/profil/presentation/view/profil_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const String routeName = 'mainlayout';
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const ExplorView(),
    const FavoritView(),
    const ProfilView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: CustomNavigatBar(
        currentIndex: selectedIndex,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
