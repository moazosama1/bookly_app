import 'package:bookly_app/features/feature_home/presentation/view/widget/book_saved_body.dart';
import 'package:flutter/material.dart';


class BookSavedView extends StatelessWidget {
   BookSavedView({super.key , required this.listIds});
  final List<String> listIds;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BookSavedBody(books:listIds,),
    );
  }
}
