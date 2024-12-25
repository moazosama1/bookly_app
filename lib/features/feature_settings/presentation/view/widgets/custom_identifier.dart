import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CustomIdentifier extends StatelessWidget {
  const CustomIdentifier({
    super.key,
    required this.text,
    required this.iconData,
  });
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withOpacity(0.4),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(iconData),
          VerticalDivider(
            color: Colors.white,
            width: 30,
            indent: 2,
            endIndent: 2,
            thickness: 3,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Style.textStyle18,
          )
        ],
      ),
    );
  }
}
