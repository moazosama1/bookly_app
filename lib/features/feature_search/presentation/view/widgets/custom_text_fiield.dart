import 'package:bookly_app/features/feature_search/presentation/view_model/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({super.key, required this.textEditingController});
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      controller: textEditingController,
      style: Style.textStyle18,
      onSubmitted: (value) async {
        BlocProvider.of<SearchBooksCubit>(context).searchBooks(query: value);
      },
      cursorColor: theme.colorScheme.onPrimary,
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: Style.textStyle20.copyWith(fontWeight: FontWeight.w500),
          suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<SearchBooksCubit>(context)
                    .searchBooks(query: textEditingController.text);
              },
              icon: Opacity(
                opacity: 0.8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: theme.colorScheme.onPrimary,
                  size: 20,
                ),
              )),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: Colors.white, width: 1.5));
  }
}
