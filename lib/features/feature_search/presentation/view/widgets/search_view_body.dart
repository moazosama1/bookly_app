import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_fiield.dart';
import 'feature_list_search_itmes.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Searching...",
            style: Style.textStyle30.copyWith(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextFiled(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search Result",
            style: Style.textStyle20,
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(child: FeatureListSearchItems())
        ],
      ),
    );
  }
}
