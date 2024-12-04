import 'package:bookly_app/features/feature_search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: SearchViewBody(),
    );
  }
}

