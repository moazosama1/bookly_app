import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/feature_home/data/models/BookModel.dart';
import 'package:bookly_app/features/feature_home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeatureNewestBooksCubit extends Cubit<FeaturedBooksState> {
  FeatureNewestBooksCubit({required this.homeRepo}) : super(FeaturedBooksInitial());
  HomeRepo homeRepo;
  Future<void> getFeatureBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchNewestBook();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(listBooks: books));
      },
    );
  }
}
