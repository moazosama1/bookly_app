import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color.dart';
class ItemCardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/image/harry-potter-and-the-chamber-of-secrets-6.png",
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Jungle Book",
                style:
                TextStyle(fontSize: 20, color: theme.colorScheme.onPrimary),
              ),
              Text(
                "Rudyard Kipling",
                style: TextStyle(fontSize: 16, color: theme.colorScheme.outline),
              ),
              Row(
                children: [
                  Text(
                    "19.99 €",
                    style: TextStyle(
                        fontSize: 25, color: theme.colorScheme.onPrimary),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.star_fill,
                    color: ColorOfApp.goldColor,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    "4.8",
                    style: TextStyle(
                        fontSize: 24, color: theme.colorScheme.onPrimary),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    "(2390)",
                    style:
                    TextStyle(fontSize: 16, color: theme.colorScheme.outline),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}