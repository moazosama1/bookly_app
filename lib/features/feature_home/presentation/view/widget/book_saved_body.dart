import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_favorite_cubit/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../core/utils/assetsData.dart';
import '../../../../../core/widgets/custom_item_best_seller_loading.dart';
import 'appBar_widgets/custom_appBar_book_saved.dart';
import 'best_seller_item.dart';

class BookSavedBody extends StatelessWidget {
  BookSavedBody({super.key, required this.books});
  final List<String> books;
  @override
  Widget build(BuildContext context) {
    return Column(children: [const CustomAppBarSavedBook(), SavedBooks()]);
  }
}

class SavedBooks extends StatelessWidget {
  const SavedBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteSuccess) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    dismissible: DismissiblePane(onDismissed: () {
                      BlocProvider.of<FavoriteCubit>(context).deleteBook(bookId: state.listBook[index].id!);
                    }),
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context){
                          BlocProvider.of<FavoriteCubit>(context).deleteBook(bookId: state.listBook[index].id!);
                        },
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.bookmark_remove_outlined,
                        autoClose: true,
                      ),
                    ],
                  ),
                  child: BestSellerItem(
                    bookModel: state.listBook[index],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.listBook.length,
            ),
          );
        } else if (state is FavoriteInitial) {
          return Expanded(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(AssetsData.imageBoxEmpty),
                  width: 120,
                  color: Colors.white,
                ),
                Text("Empty",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900))
              ],
            )),
          );
        } else if (state is FavoriteFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: CustomItemBestSellerLoading(),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
