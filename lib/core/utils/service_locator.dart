import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/feature_home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(getIt.get<ApiService>()));

  getIt.registerSingleton<ApiService>(ApiService(Dio()));
}
