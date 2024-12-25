import 'package:bookly_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/models/BookModel.dart';

abstract class SearchRepo {
  Future<Either<ServerFailure, List<BookModel>>> searchBooks ({required String query});
}
