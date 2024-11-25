import 'package:animate_do/animate_do.dart';
import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:flutter/cupertino.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ZoomIn(child: Image.asset(AssetsData.logoApp3X))],
    );
  }
}
