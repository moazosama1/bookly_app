import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/style.dart';

class CustomAppBarSetting extends StatelessWidget {
  const CustomAppBarSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 40,
          )),
      SizedBox(width: 5,),
      Text(
        "Setting...",
        style: Style.textStyle30.copyWith(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontWeight: FontWeight.w900),
      ),
    ],);
  }
}