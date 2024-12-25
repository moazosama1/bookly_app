part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  List<BookModel> listBooks;
  SearchBooksSuccess({required this.listBooks});
}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksFailure extends SearchBooksState {
  String errorMessage;
  SearchBooksFailure({required this.errorMessage});
}
