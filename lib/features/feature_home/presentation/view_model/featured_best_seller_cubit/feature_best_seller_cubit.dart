import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../data/home/repos/home_repo.dart';

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
        print("Best Seller Success");
      },
    );
  }
}
