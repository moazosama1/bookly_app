import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/feature_home/data/favorite/repo/favorite_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteInitial());
  FavoriteRepo favoriteRepo;
  List<BookModel> listBooks = [];
  void addBookInFavorite({required BookModel bookModel}) async {
    try {
      await favoriteRepo.addItemInFavorite(bookModel: bookModel);
    } on Exception catch (e) {
      emit(FavoriteFailure(errorMessage: e.toString()));
    }
  }

  Future<List<String>> getBookIdFromFirebase() async {
    List<String> listIds = await favoriteRepo.getBookIdFromFirebase();
    return listIds;
  }

  Future<void> getListBookById({required List<String> booksIds}) async {
    emit(FavoriteLoading());
    var result = await favoriteRepo.getListBookById(booksIds);
    result.fold(
      (books) {
        listBooks = books;
        if (listBooks.isEmpty) {
          emit(FavoriteInitial());
        } else {
          emit(FavoriteSuccess(listBook: books));
        }
      },
      (error) {
        emit(FavoriteFailure(errorMessage: error.errorMessage));
      },
    );
  }

  Future<void> deleteBook({required String bookId}) async {
    await favoriteRepo.deleteBook(bookId: bookId);
    List<String> booksIds = await getBookIdFromFirebase();
    emit(FavoriteLoading());
    getListBookById(booksIds: booksIds);
  }
}
