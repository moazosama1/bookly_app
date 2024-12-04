import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/color.dart';
import '../../../../../core/utils/style.dart';

class CustomBookRating extends StatelessWidget {
   CustomBookRating({
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });
  MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: ColorOfApp.goldColor,
          size: 16,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          "4.8",
          style: Style.textStyle18
              .copyWith(color: theme.colorScheme.onPrimary),
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(2390)",
            style: Style.textStyle18
                .copyWith(color: theme.colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}