import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/models/BookModel.dart';

abstract class FavoriteRepo {
  Future<void> addItemInFavorite({required BookModel bookModel});
  Future<List<String>> getBookIdFromFirebase();
  Future<Either<List<BookModel> , ServerFailure>> getListBookById(List<String> listIds);
  Future<void> deleteBook({required String bookId});
}