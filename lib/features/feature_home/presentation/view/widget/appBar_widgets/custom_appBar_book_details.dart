import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_favorite_cubit/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarDetails extends StatelessWidget {
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                size: 40,
              )),
          const Spacer(),
          IconButton(
            onPressed: () async {
              List<String> bookIds =
                  await BlocProvider.of<FavoriteCubit>(context)
                      .getBookIdFromFirebase();
              BlocProvider.of<FavoriteCubit>(context)
                  .getListBookById(booksIds: bookIds);
              GoRouter.of(context)
                  .push(AppRouter.kBookSavedView, extra: bookIds);
            },
            icon: Icon(
              Icons.bookmark_border,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
