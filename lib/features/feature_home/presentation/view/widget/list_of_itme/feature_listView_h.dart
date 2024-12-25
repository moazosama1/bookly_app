import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/custom_item_loading.dart';
import '../custom_item_card.dart';
class FeatureListViewItemH extends StatelessWidget {
  const FeatureListViewItemH({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return BlocBuilder<FeatureNewestBooksCubit, FeatureNewestBooksState>(
      builder: (context, state) {
        if (state is FeatureNewestBooksSuccess) {
          return SizedBox(
            height: heightMediaQuery * 0.28,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeViewDetails,
                      extra: state.listBooks[index]);
                },
                child: CustomItemCard(
                  imagePath:
                      state.listBooks[index].volumeInfo?.imageLinks?.thumbnail,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width:
                    widthMediaQuery * 0.04, // Space between items horizontally
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.listBooks.length ?? 0,
            ),
          );
        }
        else if (state is FeatureNewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else {
          return SizedBox(
            height: heightMediaQuery * 0.28,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const CustomItemLoading(),
              separatorBuilder: (context, index) => SizedBox(
                width:
                    widthMediaQuery * 0.04, // Space between items horizontally
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
