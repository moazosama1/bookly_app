part of 'featured_books_cubit.dart';

@immutable
sealed class FeatureNewestBooksState {}

final class FeatureNewestBooksInitial extends FeatureNewestBooksState {}

final class FeatureNewestBooksLoading extends FeatureNewestBooksState {}

final class FeatureNewestBooksSuccess extends FeatureNewestBooksState {
  List<BookModel> listBooks;
  FeatureNewestBooksSuccess({required this.listBooks});
}

final class FeatureNewestBooksFailure extends FeatureNewestBooksState {
  String errorMessage;
  FeatureNewestBooksFailure({required this.errorMessage});
}
