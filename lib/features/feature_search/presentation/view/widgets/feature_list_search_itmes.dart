import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_item_best_seller_loading.dart';
import '../../../../feature_home/presentation/view/widget/best_seller_item.dart';
import '../../view_model/search_books_cubit.dart';

class FeatureListSearchItems extends StatelessWidget {
  const FeatureListSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeMediaQuery = MediaQuery.of(context).size;
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => BestSellerItem(
                bookModel: state.listBooks[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.listBooks.length,
            ),
          );
        } else if (state is SearchBooksInitial) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ImageIcon(
                    AssetImage(AssetsData.imageSearchInList),
                    size: sizeMediaQuery.height * 0.2,
                  ),
                ),
                Text("Search Books",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900))
              ],
            ),
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  const CustomItemBestSellerLoading(),
              separatorBuilder: (context, index) => SizedBox(
                height: 20, // Space between items horizontally
              ),
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
