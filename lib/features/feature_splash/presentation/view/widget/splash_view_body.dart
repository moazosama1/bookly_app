import 'package:animate_do/animate_do.dart';
import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ZoomIn(child:SvgPicture.asset(AssetsData.logoSvg , height: 45,) )],
    );
  }
}
