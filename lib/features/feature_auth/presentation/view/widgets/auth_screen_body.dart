import 'package:bookly_app/core/theme/color.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/custom_button.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 15
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          SvgPicture.asset(AssetsData.logoSvg , height: 45,),
          Spacer(),
          CustomButton(
            isLoading: false,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginView);
            },
            textButton: "Login",
            colorButton: ColorOfApp.blueColor,
            colorText: theme.colorScheme.onPrimary,
            fontSize: 25,
          ),
          SizedBox(height: 20,),
          CustomButton(
            isLoading: false,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kRegisterView);
            },
            textButton: "Sign up",
            colorButton: theme.colorScheme.onPrimary,
            colorText:theme.colorScheme.primary,
            fontSize: 25,
          ),
          SizedBox(height: heightMediaQuery * 0.03,),
        ],
      ),
    );
  }
}
