import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_item_loading.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_similar_book_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../custom_item_card.dart';

class FeatureListSimilarBooks extends StatelessWidget {
  const FeatureListSimilarBooks({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 140,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                      width: widthMediaQuery * 0.21,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kHomeViewDetails,
                              extra: state.books[index]);
                        },
                        child: CustomItemCard(
                          imagePath: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail,
                        ),
                      ),
                    ),
                padding: EdgeInsets.only(bottom: 5),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length ?? 0);
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                  height: 140,
                      child: const CustomItemLoading(),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                padding: EdgeInsets.only(bottom: 5),
                scrollDirection: Axis.horizontal,
                itemCount: 10);
          }
        },
      ),
    );
  }
}
