import 'package:bookly_app/features/feature_home/presentation/view_model/featured_favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/style.dart';
import 'custom_book_action.dart';
import 'custom_book_rating.dart';
import 'custom_item_card.dart';

class BooksDetailsSection extends StatelessWidget {
  BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthMediaQuery * 0.205),
          child: CustomItemCard(
            imagePath: bookModel.volumeInfo?.imageLinks?.thumbnail,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo?.title ?? "",
          style: Style.textStyle30.copyWith(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? "",
            style: Style.textStyle18.copyWith(
                color: theme.colorScheme.onPrimary,
                fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              rating: bookModel.volumeInfo?.averageRating ?? 0,
              count: bookModel.volumeInfo?.ratingsCount ?? 0,
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<FavoriteCubit>(context)
                      .addBookInFavorite(bookModel: bookModel);
                  var show = toastification.show(
                    context: context,
                    foregroundColor: Colors.white,
                    showProgressBar: false,
                    title: Text(
                      "Saved",
                      style: Style.textStyle18,
                    ),
                    autoCloseDuration: const Duration(seconds: 1),
                    icon: Icon(
                      Icons.bookmark_added_outlined,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.lightGreen,
                    borderSide: BorderSide.none,
                  );
                },
                icon: Icon(
                  Icons.bookmark_add_outlined,
                  size: 30,
                ))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthMediaQuery * 0.03),
          child: CustomBookAction(
            bookModel: bookModel,
          ),
        ),
      ],
    );
  }
}
