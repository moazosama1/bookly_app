import 'package:bookly_app/core/theme/color.dart';
import 'package:flutter/material.dart';

class ThemeOfApp {
  static ThemeData basicTheme = ThemeData(
    appBarTheme:const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: ColorOfApp.whiteColor)
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorOfApp.primaryColor,
        primary: ColorOfApp.primaryColor,
        onPrimary: ColorOfApp.whiteColor,
      outline: ColorOfApp.grayColor
    ),
  );
}
