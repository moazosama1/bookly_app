import 'package:bookly_app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeOfApp {
  static ThemeData basicTheme = ThemeData(
    fontFamily: GoogleFonts.montserrat(
      color: ColorOfApp.whiteColor,
    ).fontFamily,
    scaffoldBackgroundColor: ColorOfApp.primaryColor,
    appBarTheme:const AppBarTheme(
      color: Colors.transparent,
      iconTheme:IconThemeData(color: ColorOfApp.whiteColor)
    ),
    iconTheme:const IconThemeData(
      color: ColorOfApp.whiteColor
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorOfApp.primaryColor,
        surface: ColorOfApp.blackColor,
        primary: ColorOfApp.primaryColor,
        onPrimary: ColorOfApp.whiteColor,
      outline: ColorOfApp.grayColor
    ),
  );
}
