import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import 'booksDetailsSection.dart';
import 'custom_appBar_book_details.dart';
import 'feature_list_also_like.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 25),
            child: Column(
              children: [
                const CustomAppBarDetails(),
                const BooksDetailsSection(),
                SizedBox(
                  height: heightMediaQuery * 0.04,
                ),
                Text(
                  "You can also like",
                  style: Style.textStyle18.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: heightMediaQuery * 0.016,
                ),
                const FeatureListAlsoLike(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
