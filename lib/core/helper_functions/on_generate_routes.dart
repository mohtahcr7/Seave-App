import 'package:flutter/material.dart';
import 'package:seave/featuer/auth/presentation/views/login_view.dart';

Route<dynamic> onGenetrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
