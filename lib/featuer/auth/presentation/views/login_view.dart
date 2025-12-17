import 'package:flutter/material.dart';
import 'package:seave/featuer/auth/presentation/widget/body_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: BodyLoginView());
  }
}
