
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'custom_book_action.dart';
import 'custom_book_rating.dart';
import 'custom_item_card.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthMediaQuery * 0.205),
          child: const CustomItemCard(),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "The Jungle Book",
          style: Style.textStyle30,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Style.textStyle18.copyWith(
                color: theme.colorScheme.onPrimary,
                fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        CustomBookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: heightMediaQuery * 0.037,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthMediaQuery * 0.03),
          child: const CustomBookAction(),
        ),
      ],
    );
  }
}