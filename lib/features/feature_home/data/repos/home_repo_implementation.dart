import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/feature_home/data/models/BookModel.dart';
import 'package:bookly_app/features/feature_home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiService apiService;
  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSeller() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=subject:sports&filter=free-ebooks&orderBy=newest");
      List<BookModel> books = [];
      data['items'].forEach((item) {
        books.add(BookModel.fromJson(item));
      });

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(
            ServerFailure(errorMessage: "Something wont wrong,try again"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBook() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?q=subject:sports&filter=free-ebooks");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(
            ServerFailure(errorMessage: "Something wont wrong,try again"));
      }
    }
  }
}
