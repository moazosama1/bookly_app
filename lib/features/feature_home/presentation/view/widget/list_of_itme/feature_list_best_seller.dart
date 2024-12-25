import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_item_best_seller_loading.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_best_seller_cubit/feature_best_seller_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../best_seller_item.dart';

class FeatureListBestSeller extends StatelessWidget {
  const FeatureListBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBestSellerCubit, FeatureBestSellerState>(
      builder: (context, state) {
        if (state is FeatureBestSellerSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: BestSellerItem(
                bookModel: state.listBooks[index],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.listBooks.length,
          );
        }
        else if (state is FeatureBestSellerFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: CustomItemBestSellerLoading(),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 10,
          );
        }
      },
    );
  }
}
