import 'package:bookly_app/features/presentation/view/widget/splash_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body:const SplashViewBody(),
    );
  }
}
