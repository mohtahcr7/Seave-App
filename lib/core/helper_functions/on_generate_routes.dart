import 'package:flutter/material.dart';
import 'package:seave/featuer/auth/presentation/views/login_view.dart';
import 'package:seave/featuer/auth/presentation/views/register_view.dart';
import 'package:seave/featuer/home/presentation/view/home_view.dart';

Route<dynamic> onGenetrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
