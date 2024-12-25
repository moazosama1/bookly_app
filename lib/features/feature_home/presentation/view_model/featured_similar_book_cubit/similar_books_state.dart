part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  List<BookModel> books;
  SimilarBooksSuccess({required this.books});
}

final class SimilarBooksFailure extends SimilarBooksState {
  String errorMessage;
  SimilarBooksFailure({required this.errorMessage});
}
