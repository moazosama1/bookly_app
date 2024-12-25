import 'package:bookly_app/features/feature_home/presentation/view/widget/book_details_body.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_similar_book_cubit/similar_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/BookModel.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(category: widget.bookModel.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsBody(bookModel:widget.bookModel,),
    );
  }
}
