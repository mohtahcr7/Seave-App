import 'package:flutter/material.dart';
import 'package:seave/feature/auth/presentation/views/login_view.dart';
import 'package:seave/feature/auth/presentation/views/register_view.dart';
import 'package:seave/feature/details/presentation/view/details_view.dart';
import 'package:seave/feature/home/presentation/view/home_view.dart';
import 'package:seave/feature/village_list/presentation/views/village_list_screen.dart';

Route<dynamic> onGenetrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case DetailsView.routeName:
      return MaterialPageRoute(builder: (context) => const DetailsView());
    case VillageListScreen.routeName:
      return MaterialPageRoute(builder: (context) => const VillageListScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
