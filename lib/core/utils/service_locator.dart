import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/feature_auth/data/repo/auth_repo_impl.dart';
import 'package:bookly_app/features/feature_home/data/favorite/repo/favorite_repo_impl.dart';
import 'package:bookly_app/features/feature_search/data/repo/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/feature_home/data/home/repos/home_repo_implementation.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<FavoriteRepoImpl>(FavoriteRepoImpl());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
