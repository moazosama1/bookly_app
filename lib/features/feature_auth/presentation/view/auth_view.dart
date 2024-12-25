import 'package:bookly_app/features/feature_auth/presentation/view/widgets/auth_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreenBody(),
    );
  }
}
