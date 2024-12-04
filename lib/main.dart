import 'package:bookly_app/core/theme/theme.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/feature_home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_best_seller_cubit/feature_best_seller_cubit.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBestSellerCubit(
              homeRepo: getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) => FeatureNewestBooksCubit(
              homeRepo: getIt.get<HomeRepoImplementation>()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeOfApp.basicTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
