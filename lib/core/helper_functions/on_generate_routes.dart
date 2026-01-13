import 'package:flutter/material.dart';
import 'package:seave/feature/auth/presentation/views/login_view.dart';
import 'package:seave/feature/auth/presentation/views/register_view.dart';
import 'package:seave/feature/details/presentation/view/details_view.dart';
import 'package:seave/feature/explor/presentation/view/explor_view.dart';
import 'package:seave/feature/fav/presentation/view/favorit_view.dart';
import 'package:seave/feature/home/presentation/view/home_view.dart';
import 'package:seave/feature/home/presentation/view/main_layout.dart';
import 'package:seave/feature/onBoarding/view/on_bording_view.dart';
import 'package:seave/feature/profil/presentation/view/profil_view.dart';
import 'package:seave/feature/village_list/presentation/views/village_list_screen.dart';

Route<dynamic> onGenetrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBordingView.routName:
      return MaterialPageRoute(builder: (context) => const OnBordingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case MainLayout.routeName:
      return MaterialPageRoute(builder: (context) => const MainLayout());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case DetailsView.routeName:
      return MaterialPageRoute(builder: (context) => const DetailsView());
    case VillageListScreen.routeName:
      return MaterialPageRoute(builder: (context) => const VillageListScreen());
    case ProfilView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfilView());
    case FavoritView.routeName:
      return MaterialPageRoute(builder: (context) => const FavoritView());
    case ExplorView.routeName:
      return MaterialPageRoute(builder: (context) => const ExplorView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
