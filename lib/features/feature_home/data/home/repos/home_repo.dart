import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/models/BookModel.dart';



abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSeller();
  Future<Either<Failure, List<BookModel>>> fetchNewestBook();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
