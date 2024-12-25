import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'style.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.textButton,
      required this.colorButton,
      required this.colorText,
      this.borderButton,
      this.fontSize,
      this.onPressed,
      this.colorLoading,
      required this.isLoading});
  bool isLoading;
  String textButton;
  Color colorButton;
  Color? colorLoading;
  Color colorText;
  BorderRadius? borderButton;
  double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SizedBox(
      height: heightMediaQuery * 0.06,
      child: TextButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: RoundedRectangleBorder(
                  borderRadius: borderButton ?? BorderRadius.circular(14))),
          child: !isLoading
              ? Text(
                  textButton,
                  style: Style.textStyle20
                      .copyWith(color: colorText, fontSize: fontSize ?? 20),
                )
              : CircularProgressIndicator(
                  color: colorLoading ?? theme.colorScheme.primary,
                )),
    );
  }
}
