import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/style.dart';

class CustomAppBarSavedBook extends StatelessWidget {
  const CustomAppBarSavedBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 40,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            "The preserved...",
            style: Style.textStyle30.copyWith(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}