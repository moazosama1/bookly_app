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
      });
  String textButton;
  Color colorButton;
  Color colorText;
  BorderRadius? borderButton;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SizedBox(
      height: heightMediaQuery * 0.06,
      child: TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: RoundedRectangleBorder(
                  borderRadius: borderButton ?? BorderRadius.circular(14))),
          child: Text(
            textButton,
            style: Style.textStyle20.copyWith(color: colorText, fontSize: fontSize ?? 20 ),
          )),
    );
  }
}
