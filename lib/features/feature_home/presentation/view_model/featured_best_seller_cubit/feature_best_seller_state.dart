part of 'feature_best_seller_cubit.dart';

@immutable
sealed class FeatureBestSellerState {}

final class FeatureBestSellerInitial extends FeatureBestSellerState {}

final class FeatureBestSellerSuccess extends FeatureBestSellerState {
  List<BookModel> listBooks;
  FeatureBestSellerSuccess({required this.listBooks});
}

final class FeatureBestSellerFailure extends FeatureBestSellerState {
  String errorMessage;
  FeatureBestSellerFailure({required this.errorMessage});
}

final class FeatureBestSellerLoading extends FeatureBestSellerState {}
