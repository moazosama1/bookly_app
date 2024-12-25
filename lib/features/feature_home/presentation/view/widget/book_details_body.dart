import 'package:flutter/material.dart';
import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/style.dart';
import 'books_details_section.dart';
import 'appBar_widgets/custom_appBar_book_details.dart';
import 'list_of_itme/feature_list_similar_books.dart';

class BookDetailsBody extends StatelessWidget {
  BookDetailsBody({super.key, required this.bookModel});
  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SingleChildScrollView(
      physics:const  BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 25),
            child: Column(
              children: [
                const CustomAppBarDetails(),
                BooksDetailsSection(
                  bookModel: bookModel,
                ),
                SizedBox(
                  height: heightMediaQuery * 0.04,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Style.textStyle18.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: heightMediaQuery * 0.006,
                ),
              ],
            ),
          ),
          const FeatureListSimilarBooks()
        ],
      ),
    );
  }
}
