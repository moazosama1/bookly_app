import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/feature_home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSeller();
  Future<Either<Failure, List<BookModel>>> fetchNewestBook();
}
