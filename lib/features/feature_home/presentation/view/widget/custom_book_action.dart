import 'package:bookly_app/core/utils/custom_button.dart';
import 'package:bookly_app/core/function/custom_launch_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/theme/color.dart';

class CustomBookAction extends StatelessWidget {
  CustomBookAction({super.key, required this.bookModel});
  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isLoading: false,
            onPressed: () {},
            textButton:
                "${bookModel.saleInfo?.retailPrice?.amount ?? "Free"} ${bookModel.saleInfo?.retailPrice?.currencyCode ?? ""}",
            colorText: theme.colorScheme.surface,
            colorButton: theme.colorScheme.onPrimary,
            borderButton: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
        ),
        Expanded(
          child: CustomButton(
            isLoading: false,
            textButton: "Preview",
            fontSize: 20,
            onPressed: () async {
              customLaunchUrl(bookModel.volumeInfo!.infoLink!);
            },
            colorText: theme.colorScheme.onPrimary,
            colorButton: ColorOfApp.orangeColor,
            borderButton: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
