import 'package:bookly_app/features/feature_home/presentation/view/home_screen.dart';
import 'package:bookly_app/features/feature_splash/presentation/view/widget/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    goToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  goToHomeView() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(HomeScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 300),);
      },
    );
  }
}
