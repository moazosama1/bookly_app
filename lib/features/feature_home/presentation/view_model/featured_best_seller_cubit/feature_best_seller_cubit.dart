import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/feature_home/data/models/BookModel.dart';
import 'package:bookly_app/features/feature_home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'feature_best_seller_state.dart';

class FeatureBestSellerCubit extends Cubit<FeatureBestSellerState> {
  FeatureBestSellerCubit({required this.homeRepo})
      : super(FeatureBestSellerInitial());
  HomeRepo homeRepo;
  Future<void> getBestSellerBooks() async {
    emit(FeatureBestSellerLoading());
    var result = await homeRepo.fetchBestSeller();
    result.fold(
      (failure) {
        emit(FeatureBestSellerFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(FeatureBestSellerSuccess(listBooks: books));
      },
    );
  }
}
