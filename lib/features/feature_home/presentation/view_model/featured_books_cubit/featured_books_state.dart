part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  List<BookModel> listBooks;
  FeaturedBooksSuccess({required this.listBooks});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  String errorMessage;
  FeaturedBooksFailure({required this.errorMessage});
}
