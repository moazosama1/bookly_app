import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../data/home/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeatureNewestBooksCubit extends Cubit<FeatureNewestBooksState> {
  FeatureNewestBooksCubit({required this.homeRepo}) : super(FeatureNewestBooksInitial());
  HomeRepo homeRepo;
  Future<void> getFeatureBooks() async {
    emit(FeatureNewestBooksLoading());
    var result = await homeRepo.fetchNewestBook();
    result.fold(
      (failure) {
        emit(FeatureNewestBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(FeatureNewestBooksSuccess(listBooks: books));
      },
    );
  }
}
