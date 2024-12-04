import 'package:bookly_app/core/utils/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/color.dart';

class CustomBookAction extends StatelessWidget {
  const CustomBookAction({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            textButton: "19.99€",
            colorText: theme.colorScheme.surface,
            colorButton: theme.colorScheme.onPrimary,
            borderButton: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
        ),
        Expanded(
          child: CustomButton(
            textButton: "Free preview",
            fontSize: 20,
            colorText: theme.colorScheme.onPrimary,
            colorButton: ColorOfApp.orangeColor,
            borderButton: const BorderRadius.only(
                topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
