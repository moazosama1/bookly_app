import 'package:bookly_app/features/feature_auth/presentation/view/widgets/register_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterScreenBody(),
    );
  }
}
