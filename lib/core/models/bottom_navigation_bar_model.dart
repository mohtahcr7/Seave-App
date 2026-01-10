import 'package:seave/gen/assets.gen.dart';

class BottomNavigationBarModel {
  final String title;
  final String outlineIcon, activeIcon;

  BottomNavigationBarModel({
    required this.title,
    required this.outlineIcon,
    required this.activeIcon,
  });

  static List<BottomNavigationBarModel> get bottomNavigationBarItems => [
    BottomNavigationBarModel(
      title: 'الرئيسية',
      outlineIcon: const $AssetsImageGen().homeIcon.path,
      activeIcon: const $AssetsImageGen().activeHomeIcon.path,
    ),
    BottomNavigationBarModel(
      title: 'استكشف',
      outlineIcon: const $AssetsImageGen().explorIcon.path,
      activeIcon: const $AssetsImageGen().activExplor.path,
    ),
    BottomNavigationBarModel(
      title: 'المفضلة',
      outlineIcon: const $AssetsImageGen().favIconsvg.path,
      activeIcon: const $AssetsImageGen().activeFavIcon.path,
    ),
    BottomNavigationBarModel(
      title: 'حسابي',
      outlineIcon: const $AssetsImageGen().profilsvg.path,
      activeIcon: const $AssetsImageGen().activeProfilIcon.path,
    ),
  ];
}
