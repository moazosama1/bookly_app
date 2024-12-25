import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/feature_search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/BookModel.dart';

class SearchRepoImplementation implements  SearchRepo{
  ApiService apiService;
  SearchRepoImplementation({required this.apiService});

  @override
  Future<Either<ServerFailure, List<BookModel>>> searchBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(endPoint: "volumes?q=subject:$query");
      List<BookModel> listBooks = [];
      for (var item in data["items"]) {
        listBooks.add(BookModel.fromJson(item));
      }
      return right(listBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(errorMessage: "Not Found"));
      }
    }
  }
}
