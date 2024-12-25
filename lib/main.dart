import 'package:bookly_app/core/theme/theme.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/feature_auth/data/repo/auth_repo_impl.dart';
import 'package:bookly_app/features/feature_auth/presentation/veiw_model/auth_cubit.dart';
import 'package:bookly_app/features/feature_home/data/favorite/repo/favorite_repo_impl.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_best_seller_cubit/feature_best_seller_cubit.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/feature_home/presentation/view_model/featured_favorite_cubit/favorite_cubit.dart';
import 'package:bookly_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/feature_home/data/home/repos/home_repo_implementation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
              homeRepo: getIt.get<HomeRepoImplementation>())
            ..getBestSellerBooks(),
        ),
        BlocProvider(
          create: (context) => FeatureNewestBooksCubit(
              homeRepo: getIt.get<HomeRepoImplementation>())
            ..getFeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              AuthCubit(authRepo: getIt.get<AuthRepoImpl>())..getUserInfo(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteCubit(favoriteRepo: getIt.get<FavoriteRepoImpl>()),
        ),
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
